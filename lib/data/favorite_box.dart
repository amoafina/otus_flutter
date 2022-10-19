import 'package:otusfood/base/base_box.dart';
import 'package:otusfood/hive/hive_boxes.dart';
import 'package:otusfood/model/entity_link.dart';
import 'package:otusfood/model/error_operation.dart';
import 'package:otusfood/model/favorite.dart';
import 'package:otusfood/model/result_operation.dart';
import 'package:otusfood/model/success_operation.dart';

class FavoriteBox extends BaseBox<Favorite> {
  Future<List<Favorite>> getFavoriteForRecipe(int recipeId) async {
    if (baseBox == null) {
      baseBox = await initBox(HiveBoxes.favoriteBox);
    }
    return baseBox?.values
            .where((element) => element.recipe.id == recipeId)
            .toList() ??
        List.empty();
  }

  Future<ResultOperation> addFavorite(int recipeId, int userId) async {
    if (baseBox == null) {
      baseBox = await initBox(HiveBoxes.favoriteBox);
    }
    Favorite? favorite;
    if (baseBox != null && baseBox!.values.isNotEmpty) {
      List<Favorite> favorites = baseBox?.values.toList() ?? List.empty();
      int index = favorites.indexWhere((element) =>
          element.recipe.id == recipeId && element.user.id == userId);
      if (index >= 0) {
        favorite = favorites.elementAt(index);
      }
    } else if (baseBox == null)
      return ErrorOperation(
        message: 'Ошибка',
      );

    int result = -1;
    if (favorite == null) {
      int lastIndex = baseBox?.values.length ?? 0;
      favorite = Favorite(
        id: lastIndex++,
        recipe: new EntityLink(id: recipeId),
        user: new EntityLink(id: userId),
      );
      result = await baseBox!.add(favorite);
    }
    if (result > 0)
      return SuccessOperation(
        object: "Успешно добавлен",
      );
    return ErrorOperation(
      message: "Ошибка при добавлении в избранное",
    );
  }

  Future<ResultOperation> removeFavorite(int recipeId, int userId) async {
    if (baseBox == null) {
      baseBox = await initBox(HiveBoxes.favoriteBox);
    }
    Favorite? favorite;
    if (baseBox != null && baseBox!.values.isNotEmpty) {
      favorite = baseBox?.values.firstWhere((element) =>
          element.recipe.id == recipeId && element.user.id == userId);
    } else if (baseBox == null)
      return ErrorOperation(
        message: 'Ошибка',
      );
    if (favorite != null) {
      int index = baseBox?.values.toList().indexWhere((element) =>
              element.recipe.id == recipeId && element.user.id == userId) ??
          -1;
      if (index >= 0) {
        await baseBox!.deleteAt(index);
        return SuccessOperation(
          object: "Успешно",
        );
      }
    }
    return ErrorOperation(
      message: "Ошибка при уалении из избранного",
    );
  }
}
