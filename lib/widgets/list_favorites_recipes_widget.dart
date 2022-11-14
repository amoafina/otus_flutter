import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otusfood/bloc/favorite_list_bloc.dart';
import 'package:otusfood/event/favorite_list_events.dart';
import 'package:otusfood/repositories/recipes_repository.dart';
import 'package:otusfood/state/favorite_list_states.dart';

import '../arguments/about_recipe_arguments.dart';
import '../model/recipe.dart';
import '../presenters/user_presenter.dart';
import '../screens/about_recipe_screen.dart';
import 'item_recipe_widget.dart';

class ListFavoritesRecipesWidget extends StatefulWidget {
  final UserPresenter userPresenter;

  ListFavoritesRecipesWidget({
    required this.userPresenter,
  });

  @override
  State<StatefulWidget> createState() => _ListFavoritesRecipesState();
}

class _ListFavoritesRecipesState extends State<ListFavoritesRecipesWidget> {
  FavoriteListBloc? _favoriteListBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteListBloc>(
      create: (builder) {
        _favoriteListBloc = FavoriteListBloc(
            recipeRepository: builder.read<RecipeRepository>());
        _favoriteListBloc?.add(GetFavoriteList(
            userId: widget.userPresenter.currentUser?.id ?? -1));
        return _favoriteListBloc!;
      },
      child: SafeArea(
        key: UniqueKey(),
        child: BlocBuilder<FavoriteListBloc, FavoriteListStates>(
          builder: (builder, state) {
            if (state is ShowFavoriteList) {
              return _createFavoriteListWidget(state.favoriteList);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _createFavoriteListWidget(List<Recipe> favorites) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      child: new ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 24,
        ),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, position) {
          var recipe = favorites[position];
          return GestureDetector(
            child: ItemRecipeWidget(recipe),
            onTap: () => Navigator.pushNamed(
              context,
              AboutFoodScreen.aboutFoodScreenName,
              arguments: new AboutRecipeArguments(recipe.id),
            ).then((value) => _favoriteListBloc?.add(GetFavoriteList(userId: widget.userPresenter.currentUser?.id??-1)),),
          );
        },
        itemCount: favorites.length,
      ),
    );
  }
}