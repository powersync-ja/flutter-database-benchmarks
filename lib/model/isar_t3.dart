import 'package:isar/isar.dart';
part 'isar_t3.g.dart';

@Collection()
class IsarT3 {
  Id? id;
  @Index()
  int a;
  @Index()
  int b;
  String c;

  IsarT3({
    this.id,
    required this.a,
    required this.b,
    required this.c,
  });
}
