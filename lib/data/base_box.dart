import 'package:hive/hive.dart';
import 'package:otusfood/model/base_module.dart';
import 'package:otusfood/model/recipe.dart';

abstract class BaseBox {
  Box? _baseBox;

  Future<List<T>> getListData<T>(String boxName) async {
    _baseBox = await Hive.openBox<T>(boxName);
    return (T as BaseModel).parseBox<Recipe>(_baseBox! as Box<T>);
  }

  Future<Iterable<int>> saveListData<T>(List<BaseModel> list, String boxName) async {
    _baseBox = await Hive.openBox<T>(boxName);
    return await _baseBox?.addAll(list) ?? [];
  }
}
