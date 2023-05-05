import 'dart:async';

import 'database/isar.dart';
import 'database/isar_batched.dart';
import 'database/object_box.dart';
import 'database/sqflite.dart';
import 'database/sqflite_batched.dart';
import 'database/sqlite_async.dart';
import 'database/sqlite_async_batched.dart';
import 'interface/benchmark.dart';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  var dir = await getTemporaryDirectory();
  var path = dir.path;
  print('Storing databases in $path');

  await Isar.initializeIsarCore(download: true);

  List<BenchmarkResults> results = [
    await test(SqfliteDBImpl(path)),
    await test(SqfliteBatchedImpl(path)),
    await test(SqliteAsyncDBImpl(path)),
    await test(SqliteAsyncBatchedImpl(path)),
    await test(IsarDBImpl(path)),
    await test(IsarBatchedImpl(path)),
    await test(ObjectBoxDBImpl(path)),
  ];

  BenchmarkResults first = results.first;
  var s = ',Test';
  for (var rr in results) {
    s += ',${rr.suite}';
  }
  print('');
  print(s);
  for (var i = 0; i < first.results.length; i++) {
    var test = first.results[i].test;
    var s = ',$test';
    for (var rr in results) {
      var r3 = rr.results[i].duration.inMilliseconds;
      s += ',$r3';
    }
    print(s);
  }
  print('');
}

Future<BenchmarkResults> test(Benchmark bm) async {
  print(bm.name);
  final results = await bm.runAll();
  return results;
}
