abstract class AboutRecipeScreenEvent {}

class GetInfoAboutRecipeEvent extends AboutRecipeScreenEvent {
  final int recipeId;


  GetInfoAboutRecipeEvent(this.recipeId);
}
