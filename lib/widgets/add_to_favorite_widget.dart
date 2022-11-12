import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otusfood/bloc/add_to_favorite_bloc.dart';
import 'package:otusfood/event/add_to_favorite_event.dart';
import 'package:otusfood/repositories/recipes_repository.dart';
import 'package:otusfood/state/add_to_favorite_state.dart';
import 'package:rive/rive.dart';

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
    return BlocProvider<AddToFavoriteBloc>(
      create: (context) => AddToFavoriteBloc(
        recipeId: recipeId,
        user: user,
        recipeRepository: context.read<RecipeRepository>(),
      )..add(CheckFavorite()),
      child: BlocBuilder<AddToFavoriteBloc, AddToFavoriteState>(
        builder: (builder, state) {
          if (state is ShowNoFavorite)
            return GestureDetector(
              child: SizedBox(
                child: RiveAnimation.asset(
                  'assets/riv/heartAnimationGray.riv',
                  controllers: [SimpleAnimation('heartAnimation')],
                  fit: BoxFit.fill,
                ),
                width: 48.0,
                height: 48.0,
              ),
              onTap: () => BlocProvider.of<AddToFavoriteBloc>(context)
                  .add(AddToFavorite()),
            );
          else if (state is ShowFavorite)
            return GestureDetector(
              child: SizedBox(
                child: RiveAnimation.asset(
                  'assets/riv/heartAnimationRed.riv',
                  controllers: [SimpleAnimation('heartAnimationRed')],
                  fit: BoxFit.fill,
                ),
                width: 48.0,
                height: 48.0,
              ),
              onTap: () => BlocProvider.of<AddToFavoriteBloc>(context)
                  .add(RemoveFromFavorite()),
            );
          else
            return Container();
        },
      ),
    );
  }
}
