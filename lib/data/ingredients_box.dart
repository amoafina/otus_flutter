import 'package:hive/hive.dart';
import 'package:otusfood/base/base_box.dart';
import 'package:otusfood/hive/hive_boxes.dart';
import 'package:otusfood/model/ingredient.dart';

class IngredientsBox extends BaseBox<Ingredient> {
  Future<List<Ingredient>> getIngredientsForRecipe(int recipeId) async {
    if (baseBox == null) {
      baseBox = await Hive.openBox<Ingredient>(HiveBoxes.ingredientsBox);
    }
    var ingredients =
        baseBox?.values.where((ingredient) => ingredient.recipeIngredients
                .where(
                  (recipeIngredient) => recipeIngredient.recipe.id == recipeId,
                )
                .isNotEmpty) ??
            List.empty();
    return ingredients.toList();
  }
}
