import 'package:otusfood/api/food_api.dart';
import 'package:otusfood/data/recipe_box.dart';

import '../hive/hive_boxes.dart';
import '../model/recipe.dart';

class RecipeRepository {
  final FoodApi _foodApi;
  final RecipeBox _recipeBox;

  RecipeRepository({
    required FoodApi foodApi,
    required RecipeBox recipeBox,
  })  : _foodApi = foodApi,
        _recipeBox = recipeBox;

  Future<List<Recipe>> getRecipes() async {
    var localRecipes = await _recipeBox.getListData(HiveBoxes.recipeBox);
    if (localRecipes.isEmpty) {
      var remoteRecipes = await _foodApi.getRecipes();
      if (remoteRecipes.isEmpty)return List.empty();
      await _recipeBox.saveListData(remoteRecipes, HiveBoxes.recipeBox);
      return await _recipeBox.getListData(HiveBoxes.recipeBox);
    }
    return localRecipes;
  }
}
