import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otusfood/event/about_recipe_screen_events.dart';
import 'package:otusfood/model/error_operation.dart';
import 'package:otusfood/model/ingredient.dart';
import 'package:otusfood/model/recipe.dart';
import 'package:otusfood/model/recipe_step.dart';
import 'package:otusfood/model/result_operation.dart';
import 'package:otusfood/model/success_operation.dart';
import 'package:otusfood/state/about_recipe_screen_states.dart';

import '../model/user.dart';
import '../presenters/user_presenter.dart';
import '../repositories/ingredients_repository.dart';
import '../repositories/recipe_step_repository.dart';
import '../repositories/recipes_repository.dart';

class AboutRecipeScreenBloc
    extends Bloc<AboutRecipeScreenEvent, AboutRecipeScreenState> {
  final IngredientsRepository ingredientRepository;
  final RecipeStepRepository recipeStepRepository;
  final RecipeRepository recipeRepository;
  final UserPresenter userPresenter;

  AboutRecipeScreenBloc({
    required this.ingredientRepository,
    required this.recipeStepRepository,
    required this.recipeRepository,
    required this.userPresenter,
  }) : super(InitAboutRecipe()) {
    on<GetInfoAboutRecipeEvent>((event, emit) async {
      emit(LoadingAboutRecipe());
      int recipeId = event.recipeId;
      ResultOperation resultOperation = await recipeRepository.getRecipeById(recipeId);
      if (resultOperation is ErrorOperation) {
        String message = resultOperation.message;
        print(message);
      } else if (resultOperation is SuccessOperation) {
        Recipe recipe = resultOperation.object as Recipe;
        List<RecipeStep> recipeStep =
            await recipeStepRepository.getRecipeStep(recipeId);
        List<Ingredient> ingredients =
            await ingredientRepository.getIngredients(recipeId);
        User? user = userPresenter.currentUser;
        if (user != null) {
          recipeRepository.refresh(recipe.id, user.id);
        }
        emit(ShowAboutRecipe(
          recipe,
          ingredients,
          recipeStep,
          List.empty(),
        ));
      }
    });
  }

  Stream<bool> getIsFavoriteRecipeStream() =>
      recipeRepository.getIsFavoriteUserRecipe();

  void removeFavorite(int recipeId, bool isFavorite) {
    User? user = userPresenter.currentUser;
    if (user != null) {
      if (isFavorite) {
        recipeRepository.removeFavorite(
          recipeId,
          user.id,
        );
      } else {
        recipeRepository.addFavorite(
          recipeId,
          user.id,
        );
      }
    }
  }

  bool isHasCurrentUser() => userPresenter.currentUser != null;
}
