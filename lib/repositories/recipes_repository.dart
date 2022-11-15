import 'dart:async';

import 'package:otusfood/api/food_api.dart';
import 'package:otusfood/data/recipe_box.dart';
import 'package:otusfood/model/error_operation.dart';
import 'package:otusfood/model/favorite.dart';
import 'package:otusfood/model/success_operation.dart';

import '../data/favorite_box.dart';
import '../hive/hive_boxes.dart';
import '../model/recipe.dart';
import '../model/result_operation.dart';

class RecipeRepository {
  final FoodApi _foodApi;
  final RecipeBox _recipeBox;
  final FavoriteBox _favoriteBox;
  StreamController<List<Favorite>> _favoritesController =
      new StreamController.broadcast();
  StreamController<bool> _isFavoriteRecipeUser =
      new StreamController.broadcast();
  StreamController<List<Recipe>> _favoritesRecipeController =
      new StreamController.broadcast();

  RecipeRepository({
    required FoodApi foodApi,
    required RecipeBox recipeBox,
    required FavoriteBox favoriteBox,
  })  : _foodApi = foodApi,
        _recipeBox = recipeBox,
        _favoriteBox = favoriteBox;

  Future<List<Recipe>> getRecipes() async {
    var localRecipes = await _recipeBox.getListData(HiveBoxes.recipeBox);
    if (localRecipes.isEmpty) {
      var remoteRecipes = await _foodApi.getRecipes();
      if (remoteRecipes.isEmpty) return List.empty();
      await _recipeBox.saveListData(remoteRecipes, HiveBoxes.recipeBox);
      localRecipes.addAll(await _recipeBox.getListData(HiveBoxes.recipeBox));
    }
    // List<Favorite> favorites = await getFavorites();
    // localRecipes.forEach((recipe) {
    //   var recipeId = recipe.id;
      // List<Favorite> tmp =
      //     favorites.where((element) => element.recipe.id == recipeId).toList();
      // recipe.favoriteRecipes.addAll(tmp);
    // });

    return localRecipes;
  }

  Future<ResultOperation> getRecipeById(int recipeId) async {
    Recipe? recipe = await _recipeBox.getById(recipeId, HiveBoxes.recipeBox);
    if (recipe == null) {
      recipe = await _foodApi.getRecipeById(recipeId);
      if (recipe == null) return ErrorOperation(message: 'Рецепт не найден');
    }
    return SuccessOperation(
      object: recipe,
    );
  }

  getFavoriteRecipes(int userId) async {
    List<int> favoritesRecipeIds = (await getFavorites())
        .where((element) => element.user.id == userId)
        .map((e) => e.recipe.id)
        .toList();
    List<Recipe> recipes =
        await _recipeBox.getFavoritesRecipe(favoritesRecipeIds);
    _favoritesRecipeController.add(recipes);
  }

  Future<List<Recipe>> getUserFavoriteRecipes(int userId)async{
    List<int> favoritesRecipeIds = (await getFavorites())
        .where((element) => element.user.id == userId)
        .map((e) => e.recipe.id)
        .toList();
    return await _recipeBox.getFavoritesRecipe(favoritesRecipeIds);
  }

  Future<bool> isFavoriteRecipe(int userId, int recipeId) async {
    List<int> favoritesRecipeIds = (await getFavorites())
        .where((element) => element.user.id == userId)
        .map((e) => e.recipe.id)
        .toList();
    for (int id in favoritesRecipeIds) {
      if (id == recipeId) return true;
    }
    return false;
  }

  Future<List<Favorite>> getFavorites() async {
    var localFavorites = await _favoriteBox.getListData(HiveBoxes.favoriteBox);
    if (localFavorites.isEmpty) {
      var remoteFavorites = await _foodApi.getFavorite();
      if (remoteFavorites.isEmpty) return List.empty();
      await _favoriteBox.saveListData(remoteFavorites, HiveBoxes.favoriteBox);
      localFavorites
          .addAll(await _favoriteBox.getListData(HiveBoxes.favoriteBox));
    }
    return localFavorites;
  }

  Future<ResultOperation> addFavorite(
    int recipeId,
    int userId,
  ) async =>
      await _favoriteBox.addFavorite(recipeId, userId);

  _refreshFavorites(
      ResultOperation resultOperation, int recipeId, int userId) async {
    if (resultOperation is SuccessOperation) {
      refresh(recipeId, userId);
    }
  }

  refresh(int recipeId, int userId) async {
    var favoriteForRecipes = await _favoriteBox.getFavoriteForRecipe(recipeId);
    bool isFavoriteUserRecipe = favoriteForRecipes
        .where((element) =>
            element.recipe.id == recipeId && element.user.id == userId)
        .isNotEmpty;
    _isFavoriteRecipeUser.add(isFavoriteUserRecipe);
    _favoritesController.add(favoriteForRecipes);
    getFavoriteRecipes(userId);
  }

  removeFavorite(
    int recipeId,
    int userId,
  ) async {
    var resultOperation = await _favoriteBox.removeFavorite(recipeId, userId);
    _refreshFavorites(resultOperation, recipeId, userId);
  }

  Future<ResultOperation> removeFavoriteNew(
    int recipeId,
    int userId,
  ) async {
    return await _favoriteBox.removeFavorite(recipeId, userId);
  }

  Future<List<Favorite>> getFavoriteForRecipe(int recipeId) async =>
      await _favoriteBox.getFavoriteForRecipe(recipeId);

  Stream<List<Favorite>> getListFavoriteStream() {
    return _favoritesController.stream;
  }

  Stream<bool> getIsFavoriteUserRecipe() {
    return _isFavoriteRecipeUser.stream;
  }

  Stream<List<Recipe>> getFavoritesRecipes() =>
      _favoritesRecipeController.stream;
}
