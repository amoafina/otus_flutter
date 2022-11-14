abstract class CommentsEvent {}

class GetCommentsForRecipe extends CommentsEvent {
  final int recipeId;

  GetCommentsForRecipe({required this.recipeId});
}

class AddCommentToRecipe extends CommentsEvent {
  final String text;
  final String? photoPath;
  final int recipeId;

  AddCommentToRecipe({
    required this.text,
    required this.photoPath,
    required this.recipeId,
  });
}
