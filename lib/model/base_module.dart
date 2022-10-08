import 'package:hive/hive.dart';

abstract class BaseModel<T> {
  List<T> parseBox(Box<T> box);
}
