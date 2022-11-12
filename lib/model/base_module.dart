import 'package:hive/hive.dart';

class BaseModel {
  int? getItemId() => null;

  List<T> parseBox<T>(Box<T> box) => List.empty();
}
