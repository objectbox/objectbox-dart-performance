import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'model.dart';
import 'executor.dart';
import 'obx_executor.dart' as obx;

import 'sqf_executor.dart' as sqf;
import 'hive_executor.dart' as hive;

// import 'hive_lazy_executor.dart' as hive_lazy;
// import 'cf_executor.dart' as cf;
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

enum DbEngine { ObjectBox, sqflite, Hive }

class _MyHomePageState extends State<MyHomePage> {
  var _db = DbEngine.ObjectBox;
  var _indexed = false;
  final _countController = TextEditingController(text: '10000');
  final _runsController = TextEditingController(text: '10');
  late final TimeTracker _tracker = TimeTracker(_print);
  final appDir = Completer<Directory>();

  var _result = '';
  final _resultRows = <TableRow>[];

  void _print(List<String> columns) {
    setState(() {
      final cols = <Widget>[];
      for (var i = 0; i < columns.length; i++) {
        cols.add(Text(columns[i],
            softWrap: false,
            style: TextStyle(
                fontSize: 20,
                fontWeight:
                    _resultRows.isEmpty ? FontWeight.bold : FontWeight.normal),
            textAlign: i == 0 ? TextAlign.left : TextAlign.right));
      }
      _resultRows.add(TableRow(children: cols));
    });
  }

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then(appDir.complete);
  }

  Future<ExecutorBase<T>> _createExecutor<T extends TestEntity>(
      Directory dbDir) async {
    switch (_db) {
      case DbEngine.ObjectBox:
        return Future.value(obx.Executor<T>(dbDir, _tracker));
      case DbEngine.sqflite:
        return sqf.Executor.create<T>(
            Directory(path.join(dbDir.path, 'bench.db')), _tracker);
      case DbEngine.Hive:
        return hive.Executor.create<T>(dbDir, _tracker);
      // case 4:
      //   return hive_lazy.Executor.create<T>(dbDir, _tracker);
      // case 5:
      //   return cf.Executor.create<T>(dbDir, _tracker);
      default:
        throw Exception('Unknown executor');
    }
  }

  bool get indexed => _indexed && _db != DbEngine.Hive;

  void _runBenchmark() async {
    setState(() {
      _result = 'Benchmark starting...';
      _resultRows.clear();
    });

    final dbDir = (await appDir.future).createTempSync();
    print('Using temporary DB directory $dbDir');
    dbDir.createSync(recursive: true);

    ExecutorBase? executor;
    try {
      if (indexed) {
        executor = await _createExecutor<TestEntityIndexed>(dbDir);
      } else {
        executor = await _createExecutor<TestEntityPlain>(dbDir);
      }
      await _runBenchmarkOn(executor);
    } finally {
      await executor?.close();
      if (dbDir.existsSync()) dbDir.deleteSync(recursive: true);
    }
  }

  Future<void> _runBenchmarkOn<T>(ExecutorBase bench) async {
    final count = int.parse(_countController.value.text);
    final inserts = bench.prepareData(count);

    // query is executed on a database with 10 times the given number of objects
    final qStringValue = inserts[(count / 2).floor()].tString;

    // Before we start to benchmark: verify the executor works as expected.
    try {
      await bench.test(count: count, qString: qStringValue);
    } catch (e) {
      setState(() {
        _result = "Executor test failed: $e";
      });
      return;
    }

    _tracker.clear();
    final runs = int.parse(_runsController.value.text);

    for (var i = 0; i < runs; i++) {
      await bench.insertMany(inserts);
      final ids = inserts.map((e) => e.id).toList(growable: false);
      final itemsOptional = await bench.readMany(ids);
      final items = bench.allNotNull(itemsOptional);
      bench.changeValues(items);
      await bench.updateMany(items);
      await bench.removeMany(ids);
      await bench.queryStringEquals(qStringValue);

      setState(() {
        _result = '${i + 1}/$runs finished';
      });
      await Future.delayed(Duration(seconds: 0)); // yield to re-render
    }

    _result = 'Benchmark finished (index = $indexed)\n';
    _tracker.printTimes(avgOnly: true, functions: [
      'insertMany',
      'readMany',
      'updateMany',
      'removeMany',
      'queryStringEquals',
    ]);

    // Sanity check after the benchmark: subsequent runs must have same results.
    try {
      await bench.test(count: count, qString: null);
    } catch (e) {
      setState(() {
        _result = "Executor test failed: $e";
      });
      return;
    }
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
                  items: DbEngine.values
                      .map((DbEngine e) => DropdownMenuItem(
                            child: Text(e.toString().substring(
                                e.runtimeType.toString().length + 1)),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (DbEngine? value) {
                    setState(() {
                      _db = value!;
                      _result = '';
                      _resultRows.clear();
                    });
                  }),
              Spacer(),
              Text('Index'),
              if (_db == DbEngine.Hive)
                Text(' not available')
              else
                Switch(
                  value: _indexed,
                  onChanged: (value) {
                    setState(() {
                      _indexed = value;
                    });
                  },
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
              Spacer(),
              Expanded(
                  child: TextField(
                keyboardType: TextInputType.number,
                controller: _countController,
                decoration: InputDecoration(
                  labelText: 'Count',
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
      floatingActionButton: FloatingActionButton(
        onPressed: _runBenchmark,
        tooltip: 'Start',
        child: Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
