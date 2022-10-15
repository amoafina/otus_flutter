import 'package:otusfood/api/food_api.dart';
import 'package:otusfood/data/recipe_step_box.dart';
import 'package:otusfood/hive/hive_boxes.dart';
import 'package:otusfood/model/recipe_step.dart';
import 'package:otusfood/base/base_repository.dart';

class RecipeStepRepository extends BaseRepository<RecipeStepBox> {
  RecipeStepRepository({required FoodApi foodApi, required baseBox})
      : super(foodApi: foodApi, baseBox: baseBox);

  Future<List<RecipeStep>> getRecipeStep(int recipeId) async {
    var localRecipeSteps = await baseBox.getSteps(recipeId);
    if (localRecipeSteps.isEmpty) {
      var remoteList = foodApi.getSteps(recipeId);
      if (remoteList.isEmpty) return List.empty();
      await baseBox.saveListData(remoteList, HiveBoxes.recipeStepBox);
      localRecipeSteps = await baseBox.getSteps(recipeId);
    }
    return localRecipeSteps;
  }
}
