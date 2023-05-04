import 'package:isar/isar.dart';

part 'isar_t1.g.dart';

@Collection()
class IsarT1 {
  Id? id;
  int a;
  int b;
  String c;

  IsarT1({
    this.id,
    required this.a,
    required this.b,
    required this.c,
  });
}
