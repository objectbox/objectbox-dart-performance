import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'executor.dart';
import 'obx_executor.dart' as obx;
import 'sqf_executor.dart' as sqf;
import 'hive_executor.dart' as hive;
import 'hive_lazy_executor.dart' as hive_lazy;
import 'cf_executor.dart' as cf;
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

class _MyHomePageState extends State<MyHomePage> {
  var _db = 1;
  final _countController = TextEditingController(text: '10000');
  final _runsController = TextEditingController(text: '10');
  var _result = 'not executed yet';
  late final TimeTracker _tracker = TimeTracker(outputFn: _print);
  obx.Executor? _obxExecutor;
  sqf.Executor? _sqfExecutor;
  hive.Executor? _hiveExecutor;
  hive_lazy.Executor? _hiveLazyExecutor;
  cf.Executor? _cfExecutor;

  void _print(String str) {
    setState(() {
      _result += "\n$str";
    });
  }

  @override
  void initState() {
    super.initState();

    getApplicationDocumentsDirectory().then((Directory dir) async {
      if (dir.existsSync()) dir.deleteSync(recursive: true);
      dir.createSync();
      _obxExecutor =
          obx.Executor(Directory(path.join(dir.path, 'objectbox')), _tracker);
      _sqfExecutor = await sqf.Executor.create(
          Directory(path.join(dir.path, 'sqflite')), _tracker);
      _hiveExecutor = await hive.Executor.create(
          Directory(path.join(dir.path, 'hive')), _tracker);
      _hiveLazyExecutor = await hive_lazy.Executor.create(
          Directory(path.join(dir.path, 'hive_lazy')), _tracker);
      _cfExecutor = await cf.Executor.create(
          Directory(path.join(dir.path, 'cf')), _tracker);
    });
  }

  @override
  void dispose() {
    _obxExecutor?.close();
    _sqfExecutor?.close();
    _hiveExecutor?.close();
    _hiveLazyExecutor?.close();
    _cfExecutor?.close();
    super.dispose();
  }

  void _runBenchmark() async {
    setState(() {
      _result = 'Benchmark starting...';
    });

    switch (_db) {
      case 1:
        return _runBenchmarkOn(_obxExecutor!);
      case 2:
        return _runBenchmarkOn(_sqfExecutor!);
      case 3:
        return _runBenchmarkOn(_hiveExecutor!);
      case 4:
        return _runBenchmarkOn(_hiveLazyExecutor!);
      case 5:
        return _runBenchmarkOn(_cfExecutor!);
      default:
        throw Exception('Unknown executor');
    }
  }

  void _runBenchmarkOn(ExecutorBase bench) async {
    _tracker.clear();
    final inserts = bench.prepareData(int.parse(_countController.value.text));
    final runs = int.parse(_runsController.value.text);

    for (var i = 0; i < runs; i++) {
      await bench.insertMany(inserts);
      final ids = inserts.map((e) => e.id).toList(growable: false);
      final itemsOptional = await bench.readMany(ids);
      final items = itemsOptional.map((e) => e!).toList(growable: false);
      bench.changeValues(items);
      await bench.updateMany(items);
      await bench.removeMany(ids);

      setState(() {
        _result = '${i + 1}/$runs finished';
      });
      await Future.delayed(Duration(seconds: 0)); // yield to re-render
    }

    _result = '';
    _tracker.printTimes(avgOnly: true, functions: [
      'insertMany',
      'readMany',
      'updateMany',
      'removeMany',
    ]);
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
                  items: [
                    DropdownMenuItem(
                      child: Text('ObjectBox'),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("sqflite"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Hive"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("Hive Lazy"),
                      value: 4,
                    ),
                    DropdownMenuItem(
                      child: Text("Cloud Firestore"),
                      value: 5,
                      // max batch size for firestore is 500
                      onTap: () => _countController.text = '500',
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _db = value as int;
                    });
                  }),
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
