import 'package:objectbox/objectbox.dart';

@Entity()
class ObjectBoxT2 {
  @Id()
  int id;
  int a;
  int b;
  String c;

  ObjectBoxT2({this.id = 0, required this.a, required this.b, required this.c});
}
