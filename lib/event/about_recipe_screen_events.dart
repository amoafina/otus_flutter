abstract class AboutRecipeScreenEvent {}

class RecipeInformationRequested extends AboutRecipeScreenEvent {
  final int recipeId;


  RecipeInformationRequested(this.recipeId);
}
