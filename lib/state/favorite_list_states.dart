import '../model/recipe.dart';

abstract class FavoriteListStates{}

class Init extends FavoriteListStates{}

class ShowFavoriteList extends FavoriteListStates{
  final List<Recipe> favoriteList;

  ShowFavoriteList({required this.favoriteList});
}

class ShowEmptyList extends FavoriteListStates{}