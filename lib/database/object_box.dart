import 'dart:io';
import 'dart:math';

import './util.dart';
import '../interface/benchmark.dart';
import '../model/objectbox_t1.dart';
import '../model/objectbox_t2.dart';
import '../model/objectbox_t3.dart';
import '../objectbox.g.dart';

class ObjectBoxDBImpl extends Benchmark {
  late Store store;
  final String path;

  ObjectBoxDBImpl(this.path);

  final random = Random(0);

  @override
  String get name => 'ObjectBox';

  @override
  Future<void> setUp() async {
    store = await openStore(directory: path);
    await clear();
  }

  @override
  Future<void> tearDown() async {
    store.close();
  }

  @override
  Future<int> getDbSize() async {
    final files = Directory(path)
        .listSync(recursive: true)
        .where((file) => file.path.toLowerCase().contains('objectbox'));
    int size = 0;
    for (FileSystemEntity file in files) {
      final stat = file.statSync();
      size += stat.size;
    }
    return size;
  }

  Future<void> clear() async {
    final boxT1 = Box<ObjectBoxT1>(store);
    final boxT2 = Box<ObjectBoxT2>(store);
    final boxT3 = Box<ObjectBoxT3>(store);
    await boxT1.removeAllAsync();
    await boxT2.removeAllAsync();
    await boxT3.removeAllAsync();
  }

  @override
  Future<void> test1() async {
    final boxT1 = Box<ObjectBoxT1>(store);
    for (var i = 0; i < 1000; i++) {
      final n = random.nextInt(100000);

      await boxT1.putAsync(ObjectBoxT1(a: i + 1, b: n, c: numberName(n)));
    }
  }

  @override
  Future<void> test2() async {
    await store.runInTransactionAsync(TxMode.write, (store, Random random) {
      final boxT2 = Box<ObjectBoxT2>(store);
      for (var i = 0; i < 25000; ++i) {
        final n = random.nextInt(100000);
        boxT2.put(ObjectBoxT2(a: i + 1, b: n, c: numberName(n)));
      }
    }, random);
  }

  @override
  Future<void> test3() async {
    await store.runInTransactionAsync(TxMode.write, (store, Random random) {
      final boxT3 = Box<ObjectBoxT3>(store);
      for (int i = 0; i < 25000; ++i) {
        final n = random.nextInt(100000);
        boxT3.put(ObjectBoxT3(a: i + 1, b: n, c: numberName(n)));
      }
    }, random);
  }

  @override
  Future<void> test4() async {
    final boxT2 = Box<ObjectBoxT2>(store);
    for (int i = 0; i < 100; ++i) {
      final rows = await boxT2
          .query(ObjectBoxT2_.b.between(i * 100, i * 100 + 1000 - 1))
          .build()
          .findAsync();

      assertAlways(rows.length > 200);
      assertAlways(rows.length < 300);

      var sum = rows
          .map((element) => element.b)
          .reduce((value, element) => value + element);
      var avg = sum / rows.length;

      assertAlways(avg > i * 100);
      assertAlways(avg < i * 100 + 1000);
    }
  }

  @override
  Future<void> test5() async {
    final boxT2 = Box<ObjectBoxT2>(store);
    for (int i = 0; i < 100; ++i) {
      final rows = await boxT2
          .query(ObjectBoxT2_.c.contains(numberName(i + 1)))
          .build()
          .findAsync();

      var sum = rows
          .map((element) => element.b)
          .reduce((value, element) => value + element);
      var avg = sum / rows.length;

      assertAlways(rows.length > 400);
      assertAlways(rows.length < 12000);
      assertAlways(avg > 30000);
    }
  }

  @override
  Future<void> test7() async {
    await store.runInTransactionAsync(TxMode.read, (store, parameter) {
      final boxT3 = Box<ObjectBoxT3>(store);
      for (int i = 0; i < 5000; ++i) {
        final rows = boxT3
            .query(ObjectBoxT3_.b.between(i * 100, i * 100 + 100 - 1))
            .build()
            .find();
        if (i < 1000) {
          assertAlways(rows.length > 10);
          assertAlways(rows.length < 100);
        } else {
          assertAlways(rows.isEmpty);
        }
      }
    }, null);
  }

  @override
  Future<void> test8() async {
    await store.runInTransactionAsync(TxMode.write, (store, arg) {
      final boxT1 = Box<ObjectBoxT1>(store);
      for (int i = 0; i < 1000; ++i) {
        final objs = boxT1
            .query(ObjectBoxT1_.a.between(i * 10, i * 10 + 10 - 1))
            .build()
            .find();
        for (final obj in objs) {
          obj.b *= 2;
          boxT1.put(obj);
        }
      }
    }, null);
  }

  @override
  Future<void> test9() async {
    await store.runInTransactionAsync(TxMode.write, (store, Random random) {
      final boxT3 = Box<ObjectBoxT3>(store);
      for (int i = 0; i < 25000; ++i) {
        final n = random.nextInt(100000);
        var obj = boxT3.query(ObjectBoxT3_.a.equals(i + 1)).build().findFirst();
        obj!.b = n;
        boxT3.put(obj);
      }
    }, random);
  }

  @override
  Future<void> test10() async {
    await store.runInTransactionAsync(TxMode.write, (store, Random random) {
      final boxT3 = Box<ObjectBoxT3>(store);
      for (int i = 0; i < 25000; ++i) {
        final n = random.nextInt(100000);
        var obj = boxT3.query(ObjectBoxT3_.a.equals(i + 1)).build().findFirst();
        obj!.c = numberName(n);
        boxT3.put(obj);
      }
    }, random);
  }

  @override
  Future<void> test11() async {
    await store.runInTransactionAsync(TxMode.write, (store, Random random) {
      final boxT1 = Box<ObjectBoxT1>(store);
      final boxT3 = Box<ObjectBoxT3>(store);
      final t3List = boxT3.getAll();
      boxT1.putMany(t3List
          .map((obj) => ObjectBoxT1(a: obj.b, b: obj.a, c: obj.c))
          .toList());

      final t1List = boxT1.getAll();
      boxT3.putMany(t1List
          .map((obj) => ObjectBoxT3(a: obj.b, b: obj.a, c: obj.c))
          .toList());
    }, random);
  }

  @override
  Future<void> test12() async {
    await store.runInTransactionAsync(TxMode.write, (store, Random random) {
      final boxT3 = Box<ObjectBoxT3>(store);
      boxT3.query(ObjectBoxT3_.c.contains('fifty')).build().remove();
    }, random);
  }

  @override
  Future<void> test13() async {
    await store.runInTransactionAsync(TxMode.write, (store, Random random) {
      final boxT3 = Box<ObjectBoxT3>(store);
      boxT3.query(ObjectBoxT3_.a.between(10 + 1, 20000 - 1)).build().remove();
    }, random);
  }

  @override
  Future<void> test14() async {
    await store.runInTransactionAsync(TxMode.write, (store, Random random) {
      final boxT1 = Box<ObjectBoxT1>(store);
      final boxT3 = Box<ObjectBoxT3>(store);
      final t1List = boxT1.getAll();
      boxT3.putMany(t1List
          .map((obj) => ObjectBoxT3(a: obj.a, b: obj.b, c: obj.c))
          .toList());
    }, random);
  }

  @override
  Future<void> test15() async {
    await store.runInTransactionAsync(TxMode.write, (store, Random random) {
      final boxT1 = Box<ObjectBoxT1>(store);
      boxT1.removeAll();
      for (int i = 0; i < 12000; ++i) {
        final n = random.nextInt(100000);
        boxT1.put(ObjectBoxT1(a: i + 1, b: n, c: numberName(n)));
      }
    }, random);
  }

  @override
  Future<void> test16() async {
    final boxT1 = Box<ObjectBoxT1>(store);
    final boxT2 = Box<ObjectBoxT2>(store);
    final boxT3 = Box<ObjectBoxT3>(store);
    var count1 = boxT1.count();
    var count2 = boxT2.count();
    var count3 = boxT3.count();
    assertAlways(count1 == 12000);
    assertAlways(count2 == 25000);
    assertAlways(count3 > 34000);
    assertAlways(count3 < 36000);

    await clear();
  }
}
