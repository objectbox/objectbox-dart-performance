import 'dart:io';

import 'package:objectbox/objectbox.dart';

import 'model.dart';
import 'objectbox.g.dart';

class TimeTracker {
  /// list of runtimes indexed by function name
  final times = <String, List<Duration>>{};

  R track<R>(String fnName, R Function() fn) {
    final watch = Stopwatch();

    watch.start();
    final result = fn();
    watch.stop();

    times[fnName] ??= <Duration>[];
    times[fnName].add(watch.elapsed);
    return result;
  }

  void _print(List<dynamic> varArgs) {
    print(varArgs.join('\t'));
  }

  void printTimes([List<String> functions]) {
    functions ??= times.keys.toList();

    // print the whole data as a table
    _print(['Function', 'Runs', 'Average ms', 'All times']);
    for (final fun in functions) {
      final fnTimes = times[fun];

      final sum = fnTimes.map((d) => d.inMicroseconds).reduce((v, e) => v + e);
      final avg = sum.toDouble() / fnTimes.length.toDouble() / 1000;
      final timesCols = fnTimes.map((d) => d.inMicroseconds.toDouble() / 1000);
      _print([fun, fnTimes.length, avg, ...timesCols]);
    }
  }
}
