import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'executor.dart';
import 'hive_executor.dart' as hive;
import 'isar_sync_executor.dart' as isar_sync;
import 'obx_executor.dart' as obx;
import 'sqf_executor.dart' as sqf;
// import 'hive_lazy_executor.dart' as hive_lazy;
import 'time_tracker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DB Benchmark',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'DB Benchmark'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum DbEngine { ObjectBox, sqflite, Hive, IsarSync }

enum Mode { CRUD, Queries, QueryById }

enum RunState { idle, running, stopping }

class _MyHomePageState extends State<MyHomePage> {
  var _db = DbEngine.ObjectBox;
  var _mode = Mode.CRUD;
  var _indexed = false;
  final _objectsController = TextEditingController(text: '10000');
  final _runsController = TextEditingController(text: '10');
  final _operationsController = TextEditingController(text: '1000');
  final _resultsController = TextEditingController(text: '10000');
  late final TimeTracker _tracker = TimeTracker(_print);

  /// The directory where a temporary directory for each benchmark is created in.
  final appDir = Completer<Directory>();

  var _result = '';
  final _resultRows = <TableRow>[];
  RunState _state = RunState.idle;

  void _print(List<String> columns) {
    setState(() {
      final cols = <Widget>[];
      for (var i = 0; i < columns.length; i++) {
        cols.add(Text(columns[i],
            softWrap: false,
            style: TextStyle(
                fontSize: 20,
                fontWeight: (_resultRows.isEmpty || columns[i] == 'Count')
                    ? FontWeight.bold
                    : FontWeight.normal),
            textAlign: i == 0 ? TextAlign.left : TextAlign.right));
      }
      _resultRows.add(TableRow(children: cols));
    });
  }

  void configure(DbEngine db, Mode mode, bool indexed) => setState(() {
        _db = db;
        _mode = mode;
        _indexed = indexed;
        _result = '';
        _resultRows.clear();
      });

  @override
  void initState() {
    super.initState();

    /// Use getTemporaryDirectory instead of getApplicationDocumentsDirectory to
    /// avoid creating and deleting many files in a potentially backed up
    /// location on the test device.
    getTemporaryDirectory().then((value) {
      debugPrint("Using directory: " + value.absolute.path);
      appDir.complete(value);
    });
  }

  Future<ExecutorBase> _createExecutor(Directory dbDir, bool useIndexes) async {
    switch (_db) {
      case DbEngine.ObjectBox:
        if (useIndexes) {
          return Future.value(obx.ExecutorIndexed(dbDir, _tracker));
        } else {
          return Future.value(obx.ExecutorPlain(dbDir, _tracker));
        }
      case DbEngine.sqflite:
        final dbFile = Directory(path.join(dbDir.path, 'bench.db'));
        if (useIndexes) {
          return sqf.ExecutorIndexed.create(dbFile, _tracker);
        } else {
          return sqf.ExecutorPlain.create(dbFile, _tracker);
        }
      case DbEngine.Hive:
        // No explicit index support for Hive.
        return hive.Executor.create(dbDir, _tracker);
      case DbEngine.IsarSync:
        if (useIndexes) {
          return isar_sync.ExecutorIndexed.create(dbDir, _tracker);
        } else {
          return isar_sync.ExecutorPlain.create(dbDir, _tracker);
        }
      default:
        throw Exception('Unknown executor');
    }
  }

  bool get indexed => _indexed && _db != DbEngine.Hive;

  void _stopBenchmark() async => setState(() {
        _result = 'Benchmark stopping...';
        _state = RunState.stopping;
      });

  void _runBenchmark() async {
    setState(() {
      _result = 'Benchmark starting...';
      _resultRows.clear();
      _state = RunState.running;
    });

    final dbDir = (await appDir.future).createTempSync();
    print('Using temporary DB directory $dbDir');
    dbDir.createSync(recursive: true);

    ExecutorBase? executor;
    try {
      executor = await _createExecutor(dbDir, indexed);
      await _runBenchmarkOn(executor);
    } finally {
      await executor?.close();
      if (dbDir.existsSync()) dbDir.deleteSync(recursive: true);
    }
  }

  Future<void> printResult(String value) async {
    setState(() => _result = value);
    await Future.delayed(Duration(seconds: 0)); // yield to re-render
  }

  /// Waits for the given future to complete. Returns true if the benchmark
  /// should continue or false if it was stopped by the user in the meantime.
  Future<bool> awaitOrStop(Future future) async {
    await Future.any([
      future,
      Future.microtask(() async {
        while (_state == RunState.running) {
          await Future.delayed(const Duration(milliseconds: 10));
        }
        return Future.value();
      })
    ]);
    return Future.value(_state == RunState.running);
  }

  Future<void> _runBenchmarkOn(ExecutorBase bench) async {
    final objectsCount = int.parse(_objectsController.value.text);
    final runs = int.parse(_runsController.value.text);

    // Before we start to benchmark: verify the executor works as expected.
    // assert() makes this only run in debug mode
    assert(await _testBenchmark(bench));

    _tracker.clear();

    try {
      switch (_mode) {
        case Mode.CRUD:
          for (var i = 0; i < runs && _state == RunState.running; i++) {
            final inserts = bench.prepareData(objectsCount);
            if (!await awaitOrStop(bench.insertMany(inserts))) {
              break;
            }
            final ids = inserts.map((e) => e.id).toList(growable: false);
            final itemsOptional = await bench.readAll(ids);
            final items = bench.allNotNull(itemsOptional);
            assert(items.length == objectsCount);
            bench.changeValues(items);
            if (!await awaitOrStop(bench.updateMany(items))) {
              break;
            }
            await bench.removeMany(ids);

            await printResult('$_mode: ${i + 1}/$runs finished');
          }

          if (_state == RunState.running) {
            _tracker.printTimes(avgOnly: true, functions: [
              'insertMany',
              'readAll',
              'updateMany',
              'removeMany',
            ]);
          }
          break;

        case Mode.Queries:
          final random = Random();
          final operationsCount = int.parse(_operationsController.value.text);
          await printResult('Preparing data...');
          final inserts = bench.prepareData(objectsCount);
          if (!await awaitOrStop(bench.insertMany(inserts))) {
            break;
          }

          final relBench = await bench.createRelBenchmark();
          // About 9 sources have the same target
          // Ensure target count is uneven to not align with odd/even int values.
          final targetCount = objectsCount ~/ 10;
          final relTargetsCount =
              max(1, targetCount.isEven ? targetCount - 1 : targetCount);
          await relBench.insertData(objectsCount, relTargetsCount);
          final distinctSourceStrings =
              ExecutorBaseRel.distinctSourceStrings(objectsCount);
          debugPrint(
              "source groups = $distinctSourceStrings, targets = $relTargetsCount");

          final resultCounts = List<int>.filled(3, -1);

          for (var i = 0; i < runs && _state == RunState.running; i++) {
            final qStringValues = List.generate(operationsCount,
                (_) => inserts[random.nextInt(objectsCount)].tString,
                growable: false);
            final qStringMatching =
                await bench.queryStringEquals(qStringValues);
            assert(qStringMatching.length == 1);

            final qLinkConfigs = List.generate(operationsCount, (_) {
              // Ensures 5-6 results (depending on how many int condition filters).
              // Also see prepareDataSources function in executor.
              final number = random.nextInt(distinctSourceStrings);
              return ConfigQueryWithLinks('Source group #$number',
                  random.nextInt(2), 'Target #$number');
            }, growable: false);
            final relResults = await relBench.queryWithLinks(qLinkConfigs);
            RangeError.checkValueInInterval(
                relResults.length, 5, 6, 'queryWithLinks results length');

            await printResult('$_mode: ${i + 1}/$runs finished');

            resultCounts[0] = qStringMatching.length;
            resultCounts[1] = relResults.length;
          }

          if (_state == RunState.running) {
            _tracker.printTimes(avgOnly: true, functions: [
              'queryStringEquals',
              'queryWithLinks',
            ]);

            _print(<String>['', '']);
            _print(<String>['', 'Count']);
            _print(<String>['queryStringEquals', resultCounts[0].toString()]);
            _print(<String>['queryWithLinks', resultCounts[1].toString()]);

            // just so that the test after benchmarks passes
            await bench.removeMany(inserts.map((e) => e.id).toList());
          }

          await relBench.close();

          break;
        case Mode.QueryById:
          final random = Random();
          final resultsCount = int.parse(_resultsController.value.text);

          await printResult('Preparing data...');
          final inserts = bench.prepareData(objectsCount);
          if (!await awaitOrStop(bench.insertMany(inserts))) {
            break;
          }

          final ids = inserts.map((e) => e.id).toList(growable: false);

          final randomSlice = (List<int> list, int length) {
            final start = list.length == length
                ? 0
                : random.nextInt(list.length - length);
            final result = list.sublist(start, start + length);
            assert(result.length == length);
            return result;
          };

          int resultCount = 0;
          for (var i = 0; i < runs && _state == RunState.running; i++) {
            final idsShuffled = (ids.toList(growable: false))..shuffle(random);
            final randomSliceLength = min(ids.length, resultsCount);
            final qByIdItems = await bench.queryById(
                randomSlice(idsShuffled, randomSliceLength), '(random)');
            final qByIdItems2 =
                await bench.queryById(randomSlice(ids, randomSliceLength));
            assert(qByIdItems.length == qByIdItems2.length);

            await printResult('$_mode: ${i + 1}/$runs finished');

            resultCount = qByIdItems.length;
          }

          if (_state == RunState.running) {
            _tracker.printTimes(avgOnly: true, functions: [
              'queryById',
              'queryById(random)',
            ]);

            _print(<String>['', '']);
            _print(<String>['', 'Count']);
            _print(<String>['queryById', resultCount.toString()]);

            // just so that the test after benchmarks passes
            await bench.removeMany(inserts.map((e) => e.id).toList());
          }

          break;
      }
    } catch (e) {
      setState(() {
        _result = "Benchmark failed: $e";
        _state = RunState.idle;
      });
      rethrow;
    }

    // Sanity check after the benchmark: subsequent runs must have same results.
    assert(await _testBenchmark(bench));

    if (_state == RunState.stopping) {
      setState(() {
        _result = 'Benchmark stopped';
        _resultRows.clear();
      });
    }

    setState(() {
      _state = RunState.idle;
    });
  }

  Future<bool> _testBenchmark(ExecutorBase bench) async {
    try {
      final count = 100;
      await bench.test(
          count: count,
          qString: _mode == Mode.Queries
              ? bench.prepareData((count / 2).floor()).last.tString
              : null);
    } catch (e) {
      setState(() {
        _result = "Executor test failed: $e";
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [
              Spacer(),
              DropdownButton(
                  value: _db,
                  items: enumDropDownItems(DbEngine.values),
                  onChanged: (DbEngine? value) =>
                      configure(value!, _mode, _indexed)),
              Spacer(),
              DropdownButton(
                  value: _mode,
                  // TODO items: enumDropDownItems(Mode.values),
                  //      Isar queries can't be evaluated yet because the model
                  //      doesn't work relations.
                  // Note: evaluating just stringEquals() isn't an option
                  //      because it would be heavily optimized by the VM if
                  //      it's the only function executed and wouldn't be
                  //      comparable to other databases that execute other
                  //      benchmarks in the same loop.
                  items: enumDropDownItems(Mode.values
                      .where((mode) =>
                          _db != DbEngine.IsarSync ||
                          (mode != Mode.Queries && mode != Mode.QueryById))
                      .toList()),
                  onChanged: (Mode? value) => configure(_db, value!, _indexed)),
              Spacer(),
              Text('Index'),
              if (_db == DbEngine.Hive)
                Text(' not available')
              else
                Switch(
                  value: _indexed,
                  onChanged: (bool value) => configure(_db, _mode, value),
                  activeTrackColor: Colors.yellow,
                  activeColor: Colors.orangeAccent,
                ),
              Spacer(),
            ]),
            Row(children: [
              Spacer(),
              Expanded(
                  child: TextField(
                keyboardType: TextInputType.number,
                controller: _runsController,
                decoration: InputDecoration(
                  labelText: 'Runs',
                ),
              )),
              if (_mode == Mode.Queries) Spacer(),
              if (_mode == Mode.Queries)
                Expanded(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _operationsController,
                  decoration: InputDecoration(
                    labelText: 'Operations',
                  ),
                )),
              if (_mode == Mode.QueryById) Spacer(),
              if (_mode == Mode.QueryById)
                Expanded(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _resultsController,
                  decoration: InputDecoration(
                    labelText: 'Results',
                  ),
                )),
              Spacer(),
              Expanded(
                  child: TextField(
                keyboardType: TextInputType.number,
                controller: _objectsController,
                decoration: InputDecoration(
                  labelText: 'Objects',
                ),
              )),
              Spacer(),
            ]),
            Spacer(),
            Text(_result),
            Spacer(),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Table(
                    border: TableBorder(
                        horizontalInside:
                            BorderSide(color: const Color(0x55000000))),
                    children: _resultRows)),
            Spacer(),
          ],
        )),
      ),
      floatingActionButton: _state == RunState.stopping
          ? null
          : _state == RunState.running
              ? FloatingActionButton(
                  onPressed: _stopBenchmark,
                  tooltip: 'Stop',
                  child: Icon(Icons.stop),
                )
              : FloatingActionButton(
                  onPressed: _runBenchmark,
                  tooltip: 'Start',
                  child: Icon(Icons.play_arrow),
                ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

List<DropdownMenuItem<T>> enumDropDownItems<T>(List<T> values) => values
    .map((dynamic e) => DropdownMenuItem<T>(
          child:
              Text(e.toString().substring(e.runtimeType.toString().length + 1)),
          value: e,
        ))
    .toList();
