import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otusfood/bloc/add_to_favorite_bloc.dart';
import 'package:otusfood/repositories/recipes_repository.dart';
import 'package:otusfood/state/add_to_favorite_state.dart';
import 'package:rive/rive.dart';

import '../event/add_to_favorite_events.dart';
import '../model/user.dart';

class AddToFavoriteWidget extends StatelessWidget {
  final int recipeId;
  final User? user;

  AddToFavoriteWidget({
    required this.recipeId,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    AddToFavoriteBloc? addToFavoriteBloc;
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
          if (state is ShowNoFavorite) {
            return SizedBox(
              key: UniqueKey(),
              width: 24.0,
              height: 24.0,
              child: GestureDetector(
                child: new RiveAnimation.asset(
                  'assets/riv/heartAnimationGray.riv',
                  artboard: 'heartAnimationGray',
                  fit: BoxFit.fill,
                ),
                onTap: () => addToFavoriteBloc?.add(AddedToFavorites()),
              ),
            );
          } else if (state is ShowFavorite) {
            return SizedBox(
              key: UniqueKey(),
              width: 24.0,
              height: 24.0,
              child: GestureDetector(
                child: new RiveAnimation.asset(
                  'assets/riv/heartAnimationRed.riv',
                  artboard: 'heartAnimationRed',
                  fit: BoxFit.fill,
                ),
                onTap: () => addToFavoriteBloc?.add(RemovedFromFavorites()),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
