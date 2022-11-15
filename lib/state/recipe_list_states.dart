import '../model/recipe.dart';

abstract class RecipeListState {
}

class Init extends RecipeListState{}

class ShowRecipeList extends RecipeListState{
  final List<Recipe> recipeList;

  ShowRecipeList({required this.recipeList});

}

class ShowEmptyRecipeList extends RecipeListState{}