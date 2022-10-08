import 'package:otusfood/api/food_api.dart';
import 'package:otusfood/data/ingredients_box.dart';
import 'package:otusfood/model/ingredient.dart';

import '../hive/hive_boxes.dart';

class IngredientsRepository {
  final FoodApi _foodApi;
  final IngredientsBox _ingredientsBox;

  IngredientsRepository(
      {required FoodApi foodApi, required IngredientsBox ingredientsBox})
      : _foodApi = foodApi,
        _ingredientsBox = ingredientsBox;

  Future<List<Ingredient>> getIngredients(int recipeId) async {
    var localIngredients =
        await _ingredientsBox.getListData(HiveBoxes.ingredientsBox);
    if (localIngredients.isEmpty) {
      var remoteList = await _foodApi.getIngredients(recipeId);
      if (remoteList.isEmpty) {
        return List.empty();
      }
      await _ingredientsBox.saveListData(remoteList, HiveBoxes.ingredientsBox);
      return await _ingredientsBox.getListData(HiveBoxes.ingredientsBox);
    }

    return List.empty();
  }
}
