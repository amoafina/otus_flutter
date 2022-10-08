import 'package:hive/hive.dart';
import 'package:otusfood/model/base_module.dart';

abstract class BaseBox<T extends BaseModel<T>> {
  Box<T>? _baseBox;

  Future<List<T>> getListData(String boxName) async {
    _baseBox = await Hive.openBox<T>(boxName);
    return (T as BaseModel<T>).parseBox(_baseBox!);
  }

  Future<Iterable<int>> saveListData(List<T> list, String boxName) async {
    _baseBox = await Hive.openBox<T>(boxName);
    return await _baseBox?.addAll(list) ?? [];
  }
}
