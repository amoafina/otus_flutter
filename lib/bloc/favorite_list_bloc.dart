import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otusfood/event/favorite_list_events.dart';
import 'package:otusfood/repositories/recipes_repository.dart';
import 'package:otusfood/state/favorite_list_states.dart';

import '../model/recipe.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvents,FavoriteListStates>{
  FavoriteListBloc({
    required this.recipeRepository,
}) : super(Init()){
    on<GetFavoriteList>((event,emit)async{
      List<Recipe> favoriteList = await recipeRepository.getUserFavoriteRecipes(event.userId);
      if(favoriteList.isEmpty){
        emit(ShowEmptyList());
      }else {
        emit(ShowFavoriteList(favoriteList: favoriteList));
      }
    });
  }

  final RecipeRepository recipeRepository;

}