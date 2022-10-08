import 'package:otusfood/repositories/recipes_repository.dart';

import '../model/recipe.dart';

class RecipePresenter {
  RecipeRepository _recipeRepository;

  RecipePresenter({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<List<Recipe>> getRecipes() => _recipeRepository.getRecipes();
}
