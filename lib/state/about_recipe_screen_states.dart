import 'package:otusfood/model/recipe.dart';

import '../model/comment.dart';
import '../model/ingredient.dart';
import '../model/recipe_step.dart';

abstract class AboutRecipeScreenState {}

class LoadingAboutRecipe extends AboutRecipeScreenState {}

class ShowAboutRecipe extends AboutRecipeScreenState {
  final Recipe recipe;
  final List<RecipeStep> recipeSteps;
  final List<Ingredient> ingredients;
  final List<Comment> comments;

  ShowAboutRecipe(
    this.recipe,
    this.ingredients,
    this.recipeSteps,
    this.comments,
  );
}

class InitAboutRecipe extends AboutRecipeScreenState {}
