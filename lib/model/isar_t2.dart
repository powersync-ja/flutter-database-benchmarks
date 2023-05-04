import 'package:isar/isar.dart';
part 'isar_t2.g.dart';

@Collection()
class IsarT2 {
  Id? id;
  int a;
  int b;
  String c;

  IsarT2({
    this.id,
    required this.a,
    required this.b,
    required this.c,
  });
}
