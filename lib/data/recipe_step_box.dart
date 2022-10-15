import 'package:otusfood/base/base_box.dart';
import 'package:otusfood/hive/hive_boxes.dart';
import 'package:otusfood/model/recipe_step.dart';

class RecipeStepBox extends BaseBox<RecipeStep> {
  Future<List<RecipeStep>> getSteps(int recipeId) async {
    if (baseBox == null) {
      baseBox = await initBox(HiveBoxes.recipeStepBox);
    }
    return baseBox?.values
            .where((element) => element.recipeStepLinks
                .where((element) => element.recipe.id == recipeId)
                .isNotEmpty)
            .toList() ??
        List.empty();
  }
}
