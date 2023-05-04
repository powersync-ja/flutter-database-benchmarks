import 'package:objectbox/objectbox.dart';

@Entity()
class ObjectBoxT1 {
  @Id()
  int id;
  int a;
  int b;
  String c;

  ObjectBoxT1({this.id = 0, required this.a, required this.b, required this.c});
}
