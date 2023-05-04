import 'dart:io';
import 'dart:math';

import './util.dart';
import '../interface/benchmark.dart';
import '../model/isar_t1.dart';
import '../model/isar_t2.dart';
import '../model/isar_t3.dart';
import 'package:isar/isar.dart';

class IsarBatchedImpl extends Benchmark {
  late Isar isar;
  final String path;

  IsarBatchedImpl(this.path);

  final random = Random(0);

  @override
  String get name => 'Isar Batched';

  @override
  Future<void> setUp() async {
    isar = await Isar.open([IsarT1Schema, IsarT2Schema, IsarT3Schema],
        directory: path, relaxedDurability: true);

    await isar.writeTxn(() async {
      await isar.clear();
    });
  }

  @override
  Future<void> tearDown() async {
    await isar.close();
  }

  @override
  Future<int> getDbSize() async {
    final files = Directory(path)
        .listSync(recursive: true)
        .where((file) => file.path.toLowerCase().contains('isar'));
    int size = 0;
    for (FileSystemEntity file in files) {
      final stat = file.statSync();
      size += stat.size;
    }
    return size;
  }

  @override
  Future<void> test1() async {
    final t1 = isar.isarT1s;
    for (var i = 0; i < 1000; i++) {
      final n = random.nextInt(100000);

      await isar.writeTxn(() async {
        await t1.put(IsarT1(a: i + 1, b: n, c: numberName(n)));
      });
    }
  }

  @override
  Future<void> test2() async {
    final t2 = isar.isarT2s;
    await isar.writeTxn(() async {
      List<IsarT2> items = [];
      for (var i = 0; i < 25000; ++i) {
        final n = random.nextInt(100000);
        items.add(IsarT2(a: i + 1, b: n, c: numberName(n)));
      }
      await t2.putAll(items);
    });
  }

  @override
  Future<void> test3() async {
    final t3 = isar.isarT3s;
    await isar.writeTxn(() async {
      List<IsarT3> items = [];
      for (int i = 0; i < 25000; ++i) {
        final n = random.nextInt(100000);
        items.add(IsarT3(a: i + 1, b: n, c: numberName(n)));
      }
      await t3.putAll(items);
    });
  }

  @override
  Future<void> test4() async {
    await isar.txn(() async {
      var t2 = isar.isarT2s;
      for (int i = 0; i < 100; ++i) {
        var rows = await t2
            .filter()
            .bBetween(i * 100, i * 100 + 1000, includeUpper: false)
            .findAll();

        assertAlways(rows.length > 200);
        assertAlways(rows.length < 300);

        var sum = rows
            .map((element) => element.b)
            .reduce((value, element) => value + element);
        var avg = sum / rows.length;

        assertAlways(avg > i * 100);
        assertAlways(avg < i * 100 + 1000);
      }
    });
  }

  @override
  Future<void> test5() async {
    final t2 = isar.isarT2s;
    await isar.txn(() async {
      for (int i = 0; i < 100; ++i) {
        var rows =
            await t2.filter().cMatches('*${numberName(i + 1)}*').findAll();

        var sum = rows
            .map((element) => element.b)
            .reduce((value, element) => value + element);
        var avg = sum / rows.length;

        assertAlways(rows.length > 400);
        assertAlways(rows.length < 12000);
        assertAlways(avg > 30000);
      }
    });
  }

  @override
  Future<void> test6() async {
    // Isar automatically creates indexes
  }
  @override
  Future<void> test7() async {
    final t3 = isar.isarT3s;
    await isar.txn(() async {
      for (int i = 0; i < 5000; ++i) {
        var rows = await t3
            .where()
            .bBetween(i * 100, i * 100 + 100, includeUpper: false)
            .findAll();

        if (i < 1000) {
          assertAlways(rows.length > 10);
          assertAlways(rows.length < 100);
        } else {
          assertAlways(rows.isEmpty);
        }
      }
    });
  }

  @override
  Future<void> test8() async {
    final t1 = isar.isarT1s;
    await isar.writeTxn(() async {
      for (int i = 0; i < 1000; ++i) {
        final objs = await t1
            .filter()
            .aBetween(i * 10, i * 10 + 10, includeUpper: false)
            .findAll();

        for (final obj in objs) {
          obj.b *= 2;
        }
        await t1.putAll(objs);
      }
    });
  }

  @override
  Future<void> test9() async {
    final t3 = isar.isarT3s;
    await isar.writeTxn(() async {
      List<IndexKey> keys = [];
      for (int i = 0; i < 25000; ++i) {
        keys.add([i + 1]);
      }

      var objs = (await t3.getAllByIndex('a', keys)).cast<IsarT3>();
      for (var obj in objs) {
        final n = random.nextInt(100000);
        obj.b = n;
      }

      await t3.putAll(objs);
    });
  }

  @override
  Future<void> test10() async {
    final t3 = isar.isarT3s;
    await isar.writeTxn(() async {
      List<IndexKey> keys = [];
      for (int i = 0; i < 25000; ++i) {
        keys.add([i + 1]);
      }

      var objs = (await t3.getAllByIndex('a', keys)).cast<IsarT3>();
      for (var obj in objs) {
        final n = random.nextInt(100000);
        obj.c = numberName(n);
      }

      await t3.putAll(objs);
    });
  }

  @override
  Future<void> test11() async {
    final t1 = isar.isarT1s;
    final t3 = isar.isarT3s;
    await isar.writeTxn(() async {
      final t3List = await t3.where().findAll();
      await t1.putAll(
          t3List.map((obj) => IsarT1(a: obj.b, b: obj.a, c: obj.c)).toList());

      final t1List = await t1.where().findAll();
      await t3.putAll(
          t1List.map((obj) => IsarT3(a: obj.b, b: obj.a!, c: obj.c)).toList());
    });
  }

  @override
  Future<void> test12() async {
    final t3 = isar.isarT3s;
    await isar.writeTxn(() async {
      await t3.filter().cMatches('*fifty*').deleteAll();
    });
  }

  @override
  Future<void> test13() async {
    final t3 = isar.isarT3s;
    await isar.writeTxn(() async {
      await t3
          .where()
          .aBetween(10, 20000, includeLower: false, includeUpper: false)
          .deleteAll();
    });
  }

  @override
  Future<void> test14() async {
    final t1 = isar.isarT1s;
    final t3 = isar.isarT3s;
    await isar.writeTxn(() async {
      final t1List = await t1.where().findAll();
      await t3.putAll(
          t1List.map((obj) => IsarT3(a: obj.a!, b: obj.b, c: obj.c)).toList());
    });
  }

  @override
  Future<void> test15() async {
    final t1 = isar.isarT1s;
    await isar.writeTxn(() async {
      await t1.clear();
      List<IsarT1> objs = [];
      for (int i = 0; i < 12000; ++i) {
        final n = random.nextInt(100000);
        objs.add(IsarT1(a: i + 1, b: n, c: numberName(n)));
      }
      await t1.putAll(objs);
    });
  }

  @override
  Future<void> test16() async {
    var count1 = await isar.isarT1s.count();
    var count2 = await isar.isarT2s.count();
    var count3 = await isar.isarT3s.count();
    assertAlways(count1 == 12000);
    assertAlways(count2 == 25000);
    assertAlways(count3 > 34000);
    assertAlways(count3 < 36000);
    await isar.writeTxn(() async {
      await isar.isarT1s.clear();
      await isar.isarT2s.clear();
      await isar.isarT3s.clear();
    });
  }
}
