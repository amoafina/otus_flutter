import 'package:otusfood/api/food_api.dart';
import 'package:otusfood/data/users_box.dart';
import 'package:otusfood/model/result_operation.dart';

import '../base/base_repository.dart';

class UserRepository extends BaseRepository<UsersBox> {
  UserRepository({required FoodApi foodApi, required UsersBox baseBox})
      : super(foodApi: foodApi, baseBox: baseBox);

  Future<bool> checkCurrentUser() async {
    return true;
  }

  Future<ResultOperation> registrationUser(
          String login, String password) async =>
      await baseBox.registrationUser(login, password);

  Future<ResultOperation> logIn(String login, String password) async =>
      await baseBox.logIn(login, password);
}
