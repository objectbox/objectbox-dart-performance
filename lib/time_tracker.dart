class TimeTracker {
  /// list of runtimes indexed by function name
  final _times = <String, List<Duration>>{};
  final void Function(List<String>) outputFn;

  TimeTracker(this.outputFn);

  void clear() => _times.clear();

  void _saveTime(String fnName, Stopwatch watch) {
    watch.stop();

    _times[fnName] ??= <Duration>[];
    _times[fnName]!.add(watch.elapsed);
  }

  // whether the function is `async`
  bool _isAsync(dynamic Function() fn) => fn is Future Function();

  R track<R>(String fnName, R Function() fn) {
    if (_isAsync(fn)) {
      throw UnsupportedError("Use trackAsync() to track async functions.");
    }

    final watch = Stopwatch();

    watch.start();
    final result = fn();
    _saveTime(fnName, watch);
    return result;
  }

  Future<R> trackAsync<R>(String fnName, Future<R> Function() fn) async {
    if (!_isAsync(fn)) {
      throw UnsupportedError("Use track() to track synchronous functions.");
    }

    final watch = Stopwatch();

    watch.start();
    final result = await fn();
    _saveTime(fnName, watch);
    return result;
  }

  void _print(List<dynamic> varArgs) =>
      outputFn(varArgs.map((e) => e.toString()).toList());

  void printTimes({List<String>? functions, bool avgOnly = false}) {
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
            _times[fn]?.map((d) => d.inMicroseconds.toDouble() / 1000) ?? [];
        _print([fn, _count(fn), avg, ...timesCols]);
      }
    }
  }

  int _count(String fn) => _times[fn]?.length ?? 0;

  int _sum(String fn) =>
      _times[fn]?.map((d) => d.inMicroseconds).reduce((v, e) => v + e) ?? 0;

  double averageMs(String fn) =>
      _sum(fn).toDouble() / _count(fn).toDouble() / 1000;
}
