import 'package:objectbox/objectbox.dart';

@Entity()
class ObjectBoxT3 {
  @Id()
  int id;
  @Index(type: IndexType.value)
  int a;
  @Index(type: IndexType.value)
  int b;
  String c;

  ObjectBoxT3({this.id = 0, required this.a, required this.b, required this.c});
}
