import 'package:hive/hive.dart';
import 'package:otusfood/model/base_module.dart';

class BaseBox<E extends BaseModel> {
  Box<E>? baseBox;

  LazyBox<E>? lazyBox;

  Future<List<E>> getListData(String boxName) async {
    if (baseBox == null) {
      baseBox = await Hive.openBox<E>(boxName);
      if (baseBox == null) return List.empty();
    }
    List<E> list = baseBox!.values.toList();
    return list;
  }

  Future<E?> getById(int id, String boxName) async {
    if (baseBox == null) {
      baseBox = await Hive.openBox<E>(boxName);
      if (baseBox == null) return null;
    }
    E item = baseBox!.values.firstWhere((element) =>  ((element).getItemId() ?? -1) == id);
    return item;
  }

  Future<Iterable<int>> saveListData(List<E> list, String boxName) async {
    if (baseBox == null) {
      baseBox = await Hive.openBox<E>(boxName);
      if (baseBox == null) return List.empty();
    }
    await baseBox?.clear();
    for (E item in list) {
      baseBox!.add(item);
    }
    return List.empty();
  }

  Future<Box<T>> initBox<T>(String boxName) async {
    return await Hive.openBox<T>(boxName);
  }

  Future<LazyBox<T>> initLazyBox<T>(String boxName) async {
    return await Hive.openLazyBox<T>(boxName);
  }
}
