import 'package:otusfood/base/base_box.dart';
import 'package:otusfood/hive/hive_boxes.dart';
import 'package:otusfood/model/error_operation.dart';
import 'package:otusfood/model/result_operation.dart';
import 'package:otusfood/model/success_operation.dart';
import 'package:otusfood/model/user.dart';

class UsersBox extends BaseBox<User> {
  Future<ResultOperation> registrationUser(
      String login, String password) async {
    if (lazyBox == null) {
      lazyBox = await initLazyBox(HiveBoxes.usersBox);
    }

    User? user = await lazyBox?.get(login);
    if (user != null) {
      return ErrorOperation(message: 'Пользователь существует');
    } else {
      var lastUserIndex = lazyBox?.keys.length ?? 0;
      user = new User(
        id: lastUserIndex++,
        login: login,
        password: password,
        token: "test_random",
        userFreezer: [],
        favoriteRecipes: [],
        comments: [],
      );
      await lazyBox?.put(login, user);
      return SuccessOperation(
        object: user,
      );
    }
  }

  Future<ResultOperation> logIn(String login, String password) async {
    if (lazyBox == null) {
      lazyBox = await initLazyBox(HiveBoxes.usersBox);
    }
    User? user = await lazyBox?.get(login);
    if (user != null) {
      if (user.password == password) {
        return SuccessOperation(object: user);
      }
      return ErrorOperation(message: 'Не верный логин или пароль');
    } else {
      return ErrorOperation(message: 'Не верный логин или пароль');
    }
  }
}
