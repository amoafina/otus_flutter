abstract class CommentsEvent {}

class RecipeCommentsRequested extends CommentsEvent {
  final int recipeId;

  RecipeCommentsRequested({required this.recipeId});
}

class AddedCommentToRecipe extends CommentsEvent {
  final String text;
  final String? photoPath;
  final int recipeId;

  AddedCommentToRecipe({
    required this.text,
    required this.photoPath,
    required this.recipeId,
  });
}
