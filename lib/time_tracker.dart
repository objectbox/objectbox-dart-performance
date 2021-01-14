class TimeTracker {
  /// list of runtimes indexed by function name
  final _times = <String, List<Duration>>{};
  final void Function(String) _outputFn;

  TimeTracker({void Function(String) outputFn = print}) : _outputFn = outputFn;

  void clear() => _times.clear();

  R track<R>(String fnName, R Function() fn) {
    final watch = Stopwatch();

    watch.start();
    final result = fn();
    watch.stop();

    _times[fnName] ??= <Duration>[];
    _times[fnName].add(watch.elapsed);
    return result;
  }

  void _print(List<dynamic> varArgs) => _outputFn(varArgs.join('\t'));

  void printTimes({List<String> functions, bool avgOnly = false}) {
    functions ??= _times.keys.toList();

    // print the data as tab-separated a table
    _print(avgOnly
        ? ['Function', 'Average ms']
        : ['Function', 'Runs', 'Average ms', 'All times']);

    for (final fn in functions) {
      final avg = averageMs(fn).toStringAsFixed(4);
      if (avgOnly) {
        _print([fn, avg]);
      } else {
        final timesCols =
            _times[fn].map((d) => d.inMicroseconds.toDouble() / 1000);
        _print([fn, _count(fn), avg, ...timesCols]);
      }
    }
  }

  int _count(String fn) => _times[fn].length;

  int _sum(String fn) =>
      _times[fn].map((d) => d.inMicroseconds).reduce((v, e) => v + e);

  double averageMs(String fn) =>
      _sum(fn).toDouble() / _count(fn).toDouble() / 1000;
}
