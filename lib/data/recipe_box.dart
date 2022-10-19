import 'package:otusfood/base/base_box.dart';
import 'package:otusfood/hive/hive_boxes.dart';
import 'package:otusfood/model/recipe.dart';

class RecipeBox extends BaseBox<Recipe> {
  Future<List<Recipe>> getFavoritesRecipe(List<int> recipeIds) async {
    List<Recipe> recipes = await getListData(HiveBoxes.recipeBox);
    if (recipes.isEmpty) return recipes;
    return recipes.where((element) => recipeIds.contains(element.id)).toList();
  }
}
