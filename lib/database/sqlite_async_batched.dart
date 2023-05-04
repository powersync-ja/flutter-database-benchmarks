import 'dart:io';
import 'dart:math';

import 'package:path/path.dart' as path;
import 'package:sqlite_async/sqlite_async.dart';

import './util.dart';
import '../interface/benchmark.dart';

class SqliteAsyncBatchedImpl extends Benchmark {
  late SqliteDatabase db;
  String dir;

  SqliteAsyncBatchedImpl(this.dir);

  @override
  String get name => 'sqlite_async_batched';

  final random = Random(0);

  @override
  Future<void> setUp() async {
    final dbPath = path.join(dir, 'sqlite-async-batched.db');
    try {
      File(dbPath).deleteSync();
      File(dbPath + '-wal').deleteSync();
    } catch (e) {
      // Ignore
    }

    db = SqliteDatabase(path: dbPath);
    await db.initialize();
    await db.execute(
        'CREATE TABLE t1(id INTEGER PRIMARY KEY, a INTEGER, b INTEGER, c TEXT)');
    await db.execute(
        'CREATE TABLE t2(id INTEGER PRIMARY KEY, a INTEGER, b INTEGER, c TEXT)');

    await db.execute(
        '''CREATE TABLE t3(id INTEGER PRIMARY KEY, a INTEGER, b INTEGER, c TEXT)''');
    await db.execute('CREATE INDEX i3a ON t3(a)');
    await db.execute('CREATE INDEX i3b ON t3(b)');
  }

  @override
  Future<void> tearDown() async {
    await db.close();
  }

  @override
  Future<int> getDbSize() async {
    final files = Directory(dir)
        .listSync()
        .where((file) => file.path.toLowerCase().contains('sqlite-async'));
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
    await db.execute('PRAGMA wal_checkpoint(RESTART)');
  }

  /// Test 2: 25000 INSERTs in a transaction
  @override
  Future<void> test2() async {
    await db.writeTransaction((tx) async {
      List<List<dynamic>> params = [];

      for (var i = 0; i < 25000; ++i) {
        final n = random.nextInt(100000);
        params.add([i + 1, n, numberName(n)]);
      }

      await tx.executeBatch('''
      INSERT INTO t2(a, b, c) VALUES(?, ?, ?)
    ''', params);
    });
    await db.execute('PRAGMA wal_checkpoint(RESTART)');
  }

  /// Test 3: 25000 INSERTs into an indexed table
  @override
  Future<void> test3() async {
    await db.writeTransaction((tx) async {
      List<List<dynamic>> params = [];
      for (var i = 0; i < 25000; ++i) {
        final n = random.nextInt(100000);
        params.add([i + 1, n, numberName(n)]);
      }

      await tx.executeBatch('''
      INSERT INTO t3(a, b, c) VALUES(?, ?, ?)
    ''', params);
    });
    await db.execute('PRAGMA wal_checkpoint(RESTART)');
  }

  /// Test 4: 100 SELECTs without an index
  @override
  Future<void> test4() async {
    await db.readTransaction((tx) async {
      for (int i = 0; i < 100; ++i) {
        final row = await tx.get(
          'SELECT count(*) count, avg(b) avg FROM t2 WHERE b>=? AND b<?',
          [i * 100, i * 100 + 1000],
        );
        assertAlways(row['count'] > 200);
        assertAlways(row['count'] < 300);
        assertAlways(row['avg'] > i * 100);
        assertAlways(row['avg'] < i * 100 + 1000);
      }
    });
  }

  /// Test 5: 100 SELECTs on a string comparison
  @override
  Future<void> test5() async {
    await db.readTransaction((tx) async {
      for (int i = 0; i < 100; ++i) {
        var row = await tx.get(
            "SELECT count(*) count, avg(b) avg FROM t2 WHERE c LIKE ?",
            ['%${numberName(i + 1)}%']);
        assertAlways(row['count'] > 400);
        assertAlways(row['count'] < 12000);
        assertAlways(row['avg'] > 30000);
      }
    });
  }

  /// Test 7: 5000 SELECTs with an index
  @override
  Future<void> test7() async {
    await db.readTransaction((tx) async {
      for (int i = 0; i < 5000; ++i) {
        var row = await tx.get(
            'SELECT count(*) count, avg(b) avg FROM t3 WHERE b>=? AND b<?',
            [i * 100, i * 100 + 100]);
        if (i < 1000) {
          assertAlways(row['count'] > 10);
          assertAlways(row['count'] < 100);
        } else {
          assertAlways(row['count'] == 0);
        }
      }
    });
  }

  /// Test 8: 1000 UPDATEs without an index
  @override
  Future<void> test8() async {
    await db.writeTransaction((tx) async {
      for (int i = 0; i < 1000; ++i) {
        await tx.execute(
          'UPDATE t1 SET b=b*2 WHERE a>=? AND a<?',
          [i * 10, i * 10 + 10],
        );
      }
    });
    await db.execute('PRAGMA wal_checkpoint(RESTART)');
  }

  /// Test 9: 25000 UPDATEs with an index
  @override
  Future<void> test9() async {
    await db.writeTransaction((tx) async {
      List<List<dynamic>> params = [];
      for (var i = 0; i < 25000; ++i) {
        final n = random.nextInt(100000);
        params.add([n, i + 1]);
      }

      await tx.executeBatch('UPDATE t3 SET b=? WHERE a=?', params);
    });
    await db.execute('PRAGMA wal_checkpoint(RESTART)');
  }

  /// Test 10: 25000 text UPDATEs with an index
  @override
  Future<void> test10() async {
    await db.writeTransaction((tx) async {
      List<List<dynamic>> params = [];
      for (var i = 0; i < 25000; ++i) {
        final n = random.nextInt(100000);
        params.add([numberName(n), i + 1]);
      }
      await tx.executeBatch('UPDATE t3 SET c=? WHERE a=?', params);
    });
    await db.execute('PRAGMA wal_checkpoint(RESTART)');
  }

  /// Test 11: INSERTs from a SELECT
  @override
  Future<void> test11() async {
    await db.writeTransaction((tx) async {
      await tx.execute('INSERT INTO t1(a, b, c) SELECT b,a,c FROM t3');
      await tx.execute('INSERT INTO t3(a, b, c) SELECT b,a,c FROM t1');
    });
    await db.execute('PRAGMA wal_checkpoint(RESTART)');
  }

  /// Test 12: DELETE without an index
  @override
  Future<void> test12() async {
    await db.execute("DELETE FROM t3 WHERE c LIKE '%fifty%'");
    await db.execute('PRAGMA wal_checkpoint(RESTART)');
  }

  /// Test 13: DELETE with an index
  @override
  Future<void> test13() async {
    await db.execute('DELETE FROM t3 WHERE a>10 AND a<20000');
    await db.execute('PRAGMA wal_checkpoint(RESTART)');
  }

  /// Test 14: A big INSERT after a big DELETE
  @override
  Future<void> test14() async {
    await db.execute('INSERT INTO t3(a, b, c) SELECT a, b, c FROM t1');
    await db.execute('PRAGMA wal_checkpoint(RESTART)');
  }

  /// Test 15: A big DELETE followed by many small INSERTs
  @override
  Future<void> test15() async {
    await db.writeTransaction((tx) async {
      await tx.execute('DELETE FROM t1');

      List<List<dynamic>> params = [];
      for (var i = 0; i < 12000; ++i) {
        final n = random.nextInt(100000);
        params.add([i + 1, n, numberName(n)]);
      }
      await tx.executeBatch('INSERT INTO t1(a, b, c) VALUES(?, ?, ?)', params);
    });
    await db.execute('PRAGMA wal_checkpoint(RESTART)');
  }

  /// Test 16: Clear table
  @override
  Future<void> test16() async {
    var row1 = await db.get('SELECT count() count FROM t1');
    var row2 = await db.get('SELECT count() count FROM t2');
    var row3 = await db.get('SELECT count() count FROM t3');
    assertAlways(row1['count'] == 12000);
    assertAlways(row2['count'] == 25000);
    assertAlways(row3['count'] > 34000);
    assertAlways(row3['count'] < 36000);

    await db.execute('DELETE FROM t1');
    await db.execute('DELETE FROM t2');
    await db.execute('DELETE FROM t3');
    await db.execute('PRAGMA wal_checkpoint(RESTART)');
  }
}
