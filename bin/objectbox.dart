import 'dart:io';

import 'package:args/args.dart';
import 'package:glob/glob.dart';

import 'package:benchapp/obx_executor.dart';
import 'package:benchapp/time_tracker.dart';

void main(List<String> arguments) async {
  exitCode = 0; // presume success

  final argDb = 'db';
  final argCount = 'count';
  final argRuns = 'runs';

  final parser = ArgParser()
    ..addOption(argDb, defaultsTo: 'benchmark-db', help: 'database directory')
    ..addOption(argCount, defaultsTo: '10000', help: 'number of objects')
    ..addOption(argRuns,
        defaultsTo: '30', help: 'number of times the tests should be executed');

  final args = parser.parse(arguments);
  final dbDir = Directory(args[argDb]);
  final count = int.parse(args[argCount]);
  final runs = int.parse(args[argRuns]);

  print('running $runs times with $count objects in $dbDir');

  if (dbDir.existsSync()) {
    print('deleting existing DB files in $dbDir');
    final dbFilesGlob = Glob(dbDir.path + '/*.mdb');
    for (var dbFile in dbFilesGlob.listSync()) {
      dbFile.deleteSync();
    }
  }

  final tracker = TimeTracker();
  final bench = Executor(dbDir, tracker);

  final inserts = bench.prepareData(count);

  for (var i = 0; i < runs; i++) {
    bench.insertMany(inserts);
    final ids = inserts.map((e) => e.id).toList(growable: false);
    final items = await bench.readMany(ids);
    bench.changeValues(items);
    bench.updateMany(items);
    bench.removeMany(ids);

    print('${i + 1}/$runs finished');
  }

  bench.close();
  tracker.printTimes(functions: [
    'insertMany',
    'readMany',
    'updateMany',
    'removeMany',
  ]);
}