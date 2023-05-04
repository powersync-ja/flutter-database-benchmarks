import 'dart:async';
import 'dart:math';

enum BenchmarkType { write, read, delete, size }

class BenchmarkResult {
  String test;
  Duration duration;

  BenchmarkResult(this.test, this.duration);

  @override
  String toString() {
    return "$test: ${duration.inMilliseconds / 1000.0}s";
  }
}

class BenchmarkResults {
  List<BenchmarkResult> results = [];

  Future<void> record(String name, Future<void> Function() callback) async {
    final stopwatch = Stopwatch()..start();
    await callback();
    stopwatch.stop();
    results.add(BenchmarkResult(name, stopwatch.elapsed));
    print("$name :: ${stopwatch.elapsedMilliseconds}ms");
  }

  @override
  String toString() {
    return results.map((r) => r.toString()).join('\n');
  }
}

abstract class Benchmark {
  String get name;

  Future<BenchmarkResults> runAll() async {
    BenchmarkResults results = BenchmarkResults();
    await setUp();

    var watch = Stopwatch()..start();
    int droppedFrames = 0;
    var timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      var diff = watch.elapsedMilliseconds;
      if (diff >= 16) {
        droppedFrames += (diff / 16).floor();
      }
      watch.reset();
    });

    await results.record('Test 1: 1000 INSERTs', test1);
    await results.record('Test 2: 25000 INSERTs in a transaction', test2);
    await results.record('Test 3: 25000 INSERTs into an indexed table', test3);
    await results.record('Test 4: 100 SELECTs without an index', test4);
    await results.record('Test 5: 100 SELECTs on a string comparison', test5);
    await results.record('Test 7: 5000 SELECTs with an index', test7);
    await results.record('Test 8: 1000 UPDATEs without an index', test8);
    await results.record('Test 9: 25000 UPDATEs with an index', test9);
    await results.record('Test 10: 25000 text UPDATEs with an index', test10);
    await results.record('Test 11: INSERTs from a SELECT', test11);
    await results.record('Test 12: DELETE without an index', test12);
    await results.record('Test 13: DELETE with an index', test13);
    await results.record('Test 14: A big INSERT after a big DELETE', test14);
    await results.record(
        'Test 15: A big DELETE followed by many small INSERTs', test15);
    await results.record('Test 16: Clear table', test16);

    timer.cancel();
    print('dropped frames: $droppedFrames');
    await tearDown();
    return results;
  }

  Future<void> setUp();

  Future<void> test1();
  Future<void> test2();
  Future<void> test3();
  Future<void> test4();
  Future<void> test5();
  Future<void> test7();
  Future<void> test8();
  Future<void> test9();
  Future<void> test10();
  Future<void> test11();
  Future<void> test12();
  Future<void> test13();
  Future<void> test14();
  Future<void> test15();
  Future<void> test16();

  Future<void> tearDown();
}
