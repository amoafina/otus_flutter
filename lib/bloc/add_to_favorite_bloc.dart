import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otusfood/model/result_operation.dart';
import 'package:otusfood/model/success_operation.dart';
import 'package:otusfood/model/user.dart';
import 'package:otusfood/repositories/recipes_repository.dart';
import 'package:otusfood/state/add_to_favorite_state.dart';

import '../event/add_to_favorite_events.dart';

class AddToFavoriteBloc extends Bloc<AddToFavoriteEvent, AddToFavoriteState> {
  AddToFavoriteBloc({
    required this.recipeId,
    required this.user,
    required this.recipeRepository,
  }) : super(Init()) {
    on<AddToFavorite>((event, emit) async {
      if (user != null) {
        ResultOperation result = await recipeRepository.addFavorite(
          recipeId,
          user!.id,
        );
        if (result is SuccessOperation) {
          emit(ShowFavorite());
        }
      }
    });

    on<RemoveFromFavorite>((event, emit) async {
      if (user != null) {
        ResultOperation resultOperation =
            await recipeRepository.removeFavoriteNew(recipeId, user!.id);
        if (resultOperation is SuccessOperation) {
          emit(ShowNoFavorite());
        }
      }
    });

    on<CheckFavorite>((event, emit) async {
      if (user != null) {
        bool isFavorite =
            await recipeRepository.isFavoriteRecipe(user!.id, recipeId);
        emit(isFavorite ? ShowFavorite() : ShowNoFavorite());
      } else {
        emit(HideFavorite());
      }
    });
  }

  final User? user;
  final int recipeId;
  final RecipeRepository recipeRepository;
}
