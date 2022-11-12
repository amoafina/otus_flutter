import 'package:otusfood/base/base_box.dart';
import 'package:otusfood/model/comment.dart';
import 'package:otusfood/model/error_operation.dart';
import 'package:otusfood/model/success_operation.dart';

import '../hive/hive_boxes.dart';
import '../model/result_operation.dart';

class CommentsBox extends BaseBox<Comment> {
  Future<List<Comment>> getCommentsForRecipe(int recipeId) async {
    List<Comment> comments = await getListData(HiveBoxes.commentsBox);
    if (comments.isEmpty) return comments;
    return comments.where((element) => element.recipe.id == recipeId).toList();
  }

  Future<ResultOperation> addComment(Comment comment) async {
    if (baseBox == null) {
      baseBox = await initBox(HiveBoxes.commentsBox);
    }
    int key = (await baseBox?.add(comment)) ?? -1;
    return key > 0
        ? SuccessOperation(object: await getCommentsForRecipe(comment.recipe.id))
        : ErrorOperation(message: 'Ошибка при добавлении комментария');
  }
}
