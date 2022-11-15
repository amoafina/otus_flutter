import 'package:otusfood/model/recipe.dart';

import '../model/comment.dart';
import '../model/ingredient.dart';
import '../model/recipe_step.dart';

abstract class AboutRecipeScreenState {}

class LoadingRecipeInformation extends AboutRecipeScreenState {}

class ShowInformationRecipe extends AboutRecipeScreenState {
  final Recipe recipe;
  final List<RecipeStep> recipeSteps;
  final List<Ingredient> ingredients;
  final List<Comment> comments;

  ShowInformationRecipe(
    this.recipe,
    this.ingredients,
    this.recipeSteps,
    this.comments,
  );
}

class RecipeInformationInitial extends AboutRecipeScreenState {}
