import 'package:otusfood/api/food_api.dart';
import 'package:otusfood/data/comments_box.dart';
import 'package:otusfood/model/comment.dart';

import '../model/result_operation.dart';

class CommentsRepository {
  final FoodApi foodApi;
  final CommentsBox commentsBox;

  CommentsRepository({
    required this.foodApi,
    required this.commentsBox,
  });

  Future<List<Comment>> getCommentForRecipe(int recipeId) async {
    var localRecipes = await commentsBox.getCommentsForRecipe(recipeId);
    return localRecipes;
  }

  Future<ResultOperation> addComment(Comment comment) async =>
      commentsBox.addComment(comment);
}
