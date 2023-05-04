import 'dart:io';
import 'dart:math';

import './util.dart';
import '../interface/benchmark.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SqfliteBatchedImpl extends Benchmark {
  late Database db;
  String dir;

  SqfliteBatchedImpl(this.dir);

  @override
  String get name => 'sqflite_batched';

  final random = Random(0);

  @override
  Future<void> setUp() async {
    final dbPath = path.join(dir, 'sqflite-batched.db');

    try {
      File(dbPath).deleteSync();
    } catch (e) {
      // Ignore
    }

    db = await databaseFactoryFfi.openDatabase(dbPath,
        options: OpenDatabaseOptions(
            version: 1,
            onCreate: (Database db, int version) async {
              await db.execute(
                  'CREATE TABLE t1(id INTEGER PRIMARY KEY, a INTEGER, b INTEGER, c TEXT)');
              await db.execute(
                  'CREATE TABLE t2(id INTEGER PRIMARY KEY, a INTEGER, b INTEGER, c TEXT)');

              await db.execute(
                  '''CREATE TABLE t3(id INTEGER PRIMARY KEY, a INTEGER, b INTEGER, c TEXT)''');
              await db.execute('CREATE INDEX i3a ON t3(a)');
              await db.execute('CREATE INDEX i3b ON t3(b)');
            }));
  }

  @override
  Future<void> tearDown() async {
    await db.close();
  }

  @override
  Future<int> getDbSize() async {
    final files = Directory(dir)
        .listSync()
        .where((file) => file.path.toLowerCase().contains('sqflite'));
    int size = 0;
    for (FileSystemEntity file in files) {
      final stat = file.statSync();
      size += stat.size;
    }
    return size;
  }

  /// Test 1: 1000 INSERTs
  @override
  Future<void> test1() async {
    for (var i = 0; i < 1000; i++) {
      final n = random.nextInt(100000);
      await db.execute("""
    INSERT INTO t1(a, b, c) VALUES(?, ?, ?)
    """, [i + 1, n, numberName(n)]);
    }
  }

  /// Test 2: 25000 INSERTs in a transaction
  @override
  Future<void> test2() async {
    var batch = db.batch();
    for (var i = 0; i < 25000; ++i) {
      final n = random.nextInt(100000);
      batch.execute('''
      INSERT INTO t2(a, b, c) VALUES(?, ?, ?)
    ''', [i + 1, n, numberName(n)]);
    }
    await batch.commit(exclusive: true, noResult: true);
  }

  /// Test 3: 25000 INSERTs into an indexed table
  @override
  Future<void> test3() async {
    var batch = db.batch();
    for (int i = 0; i < 25000; ++i) {
      final n = random.nextInt(100000);
      batch.execute(
        'INSERT INTO t3(a, b, c) VALUES(?, ?, ?)',
        [i + 1, n, numberName(n)],
      );
    }
    await batch.commit(exclusive: true, noResult: true);
  }

  /// Test 4: 100 SELECTs without an index
  @override
  Future<void> test4() async {
    await db.transaction((tx) async {
      for (int i = 0; i < 100; ++i) {
        final row = (await tx.rawQuery(
          'SELECT count(*) count, avg(b) avg FROM t2 WHERE b>=? AND b<?',
          [i * 100, i * 100 + 1000],
        ))
            .first;
        assertAlways(row['count'] as int > 200);
        assertAlways(row['count'] as int < 300);
        assertAlways(row['avg'] as num > i * 100);
        assertAlways(row['avg'] as num < i * 100 + 1000);
      }
    }, exclusive: false);
  }

  /// Test 5: 100 SELECTs on a string comparison
  @override
  Future<void> test5() async {
    await db.transaction((tx) async {
      for (int i = 0; i < 100; ++i) {
        var row = (await tx.rawQuery(
                "SELECT count(*) count, avg(b) avg FROM t2 WHERE c LIKE ?",
                ['%${numberName(i + 1)}%']))
            .first;
        assertAlways(row['count'] as int > 400);
        assertAlways(row['count'] as int < 12000);
        assertAlways(row['avg'] as num > 30000);
      }
    }, exclusive: false);
  }

  /// Test 7: 5000 SELECTs with an index
  @override
  Future<void> test7() async {
    await db.transaction((tx) async {
      for (int i = 0; i < 5000; ++i) {
        var row = (await tx.rawQuery(
                'SELECT count(*) count, avg(b) avg FROM t3 WHERE b>=? AND b<?',
                [i * 100, i * 100 + 100]))
            .first;
        if (i < 1000) {
          assertAlways(row['count'] as int > 10);
          assertAlways(row['count'] as int < 100);
        } else {
          assertAlways(row['count'] == 0);
        }
      }
    }, exclusive: false);
  }

  /// Test 8: 1000 UPDATEs without an index
  @override
  Future<void> test8() async {
    await db.transaction((tx) async {
      for (int i = 0; i < 1000; ++i) {
        await tx.execute(
          'UPDATE t1 SET b=b*2 WHERE a>=? AND a<?',
          [i * 10, i * 10 + 10],
        );
      }
    }, exclusive: true);
  }

  /// Test 9: 25000 UPDATEs with an index
  @override
  Future<void> test9() async {
    var batch = db.batch();
    for (int i = 0; i < 25000; ++i) {
      final n = random.nextInt(100000);
      batch.execute(
        'UPDATE t3 SET b=? WHERE a=?',
        [n, i + 1],
      );
    }
    await batch.commit(exclusive: true, noResult: true);
  }

  /// Test 10: 25000 text UPDATEs with an index
  @override
  Future<void> test10() async {
    var batch = db.batch();
    for (int i = 0; i < 25000; ++i) {
      final n = random.nextInt(100000);
      batch.execute(
        'UPDATE t3 SET c=? WHERE a=?',
        [numberName(n), i + 1],
      );
    }
    await batch.commit(exclusive: true, noResult: true);
  }

  /// Test 11: INSERTs from a SELECT
  @override
  Future<void> test11() async {
    await db.transaction((tx) async {
      await tx.execute('INSERT INTO t1(a, b, c) SELECT b,a,c FROM t3');
      await tx.execute('INSERT INTO t3(a, b, c) SELECT b,a,c FROM t1');
    }, exclusive: true);
  }

  /// Test 12: DELETE without an index
  @override
  Future<void> test12() async {
    await db.execute("DELETE FROM t3 WHERE c LIKE '%fifty%'");
  }

  /// Test 13: DELETE with an index
  @override
  Future<void> test13() async {
    await db.execute('DELETE FROM t3 WHERE a>10 AND a<20000');
  }

  /// Test 14: A big INSERT after a big DELETE
  @override
  Future<void> test14() async {
    await db.execute('INSERT INTO t3(a, b, c) SELECT a, b, c FROM t1');
  }

  /// Test 15: A big DELETE followed by many small INSERTs
  @override
  Future<void> test15() async {
    await db.transaction((tx) async {
      await tx.execute('DELETE FROM t1');
      var batch = tx.batch();
      for (int i = 0; i < 12000; ++i) {
        final n = random.nextInt(100000);
        batch.execute(
          'INSERT INTO t1(a, b, c) VALUES(?, ?, ?)',
          [i + 1, n, numberName(n)],
        );
      }
      await batch.apply();
    }, exclusive: true);
  }

  /// Test 16: Clear table
  @override
  Future<void> test16() async {
    var row1 = await db.rawQuery('SELECT count() count FROM t1');
    var row2 = await db.rawQuery('SELECT count() count FROM t2');
    var row3 = await db.rawQuery('SELECT count() count FROM t3');
    assertAlways(row1.first['count'] == 12000);
    assertAlways(row2.first['count'] == 25000);
    assertAlways(row3.first['count'] as int > 34000);
    assertAlways(row3.first['count'] as int < 36000);

    await db.execute('DELETE FROM t1');
    await db.execute('DELETE FROM t2');
    await db.execute('DELETE FROM t3');
    await db.execute('PRAGMA wal_checkpoint(RESTART)');
  }
}
