import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otusfood/event/recipe_list_events.dart';
import 'package:otusfood/repositories/recipes_repository.dart';

import '../model/recipe.dart';
import '../state/recipe_list_states.dart';

class RecipeListBloc extends Bloc<RecipeListEvent, RecipeListState> {
  RecipeListBloc({
    required this.recipeRepository,
  }) : super(Init()) {
    on<RequestedListRecipes>((event, emit) async {
      List<Recipe> recipes = await recipeRepository.getRecipes();
      if(recipes.isEmpty){
        emit(ShowEmptyRecipeList());
      }else {
        emit(ShowRecipeList(recipeList: recipes));
      }
    });
  }

  final RecipeRepository recipeRepository;
}
