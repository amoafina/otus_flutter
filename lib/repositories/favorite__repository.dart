import 'package:otusfood/api/food_api.dart';
import 'package:otusfood/base/base_repository.dart';
import 'package:otusfood/data/favorite_box.dart';
import 'package:otusfood/model/favorite.dart';

import '../model/result_operation.dart';

class FavoriteRepository extends BaseRepository<FavoriteBox> {
  FavoriteRepository({
    required FoodApi foodApi,
    required FavoriteBox baseBox,
  }) : super(foodApi: foodApi, baseBox: baseBox);

  Future<ResultOperation> addFavorite(
    int recipeId,
    int userId,
  ) async =>
      await baseBox.addFavorite(recipeId, userId);

  Future<ResultOperation> removeFavorite(
    int recipeId,
    int userId,
  ) async =>
      await baseBox.removeFavorite(recipeId, userId);

  Future<List<Favorite>> getFavoriteForRecipe(int recipeId) async {
    return await baseBox.getFavoriteForRecipe(recipeId);
  }
}
