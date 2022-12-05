import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otusfood/bloc/add_to_favorite_bloc.dart';
import 'package:otusfood/childWidgets/FavoriteButtonWidget.dart';
import 'package:otusfood/repositories/recipes_repository.dart';
import 'package:otusfood/state/add_to_favorite_state.dart';

import '../event/add_to_favorite_events.dart';
import '../model/user.dart';

class AddToFavoriteWidget extends StatelessWidget {
  final int recipeId;
  final User? user;
  AddToFavoriteBloc? addToFavoriteBloc;

  AddToFavoriteWidget({
    required this.recipeId,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddToFavoriteBloc>(
      create: (context) {
        addToFavoriteBloc = AddToFavoriteBloc(
          recipeId: recipeId,
          user: user,
          recipeRepository: context.read<RecipeRepository>(),
        );
        addToFavoriteBloc?.add(CheckedInFavorites());
        return addToFavoriteBloc!;
      },
      child: BlocBuilder<AddToFavoriteBloc, AddToFavoriteState>(
        bloc: addToFavoriteBloc,
        builder: (builder, state) {
          if (state is ShowNoFavorite || state is ShowFavorite) {
            var isFavorite = state is ShowFavorite;
            return FavoriteButtonWidget(
              onTap: () {
                addToFavoriteBloc?.add(
                    isFavorite ? RemovedFromFavorites() : AddedToFavorites());
              },
              isFavorite: isFavorite,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
