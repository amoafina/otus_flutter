import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otusfood/arguments/about_recipe_arguments.dart';
import 'package:otusfood/bloc/recipe_list_bloc.dart';
import 'package:otusfood/event/recipe_list_events.dart';
import 'package:otusfood/repositories/recipes_repository.dart';
import 'package:otusfood/state/recipe_list_states.dart';

import '../model/recipe.dart';
import '../screens/about_recipe_screen.dart';
import 'item_recipe_widget.dart';

class ListRecipesWidget extends StatefulWidget {

  ListRecipesWidget();

  @override
  State<StatefulWidget> createState() => _ListRecipesState();
}

class _ListRecipesState extends State<ListRecipesWidget> {

  RecipeListBloc? recipeListBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeListBloc>(
      create: (builder) {
        recipeListBloc = RecipeListBloc(recipeRepository: builder.read<RecipeRepository>());
        recipeListBloc?.add(RequestedListRecipes());
        return recipeListBloc!;
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          child: BlocBuilder<RecipeListBloc, RecipeListState>(
            builder: (builder, state) {
              if (state is ShowRecipeList) {
                return _createListRecipesWidget(state.recipeList);
              } else if (state is Init) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _createListRecipesWidget(List<Recipe> recipes) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 24,
      ),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, position) {
        var recipe = recipes[position];
        return GestureDetector(
          child: ItemRecipeWidget(recipe),
          onTap: () => Navigator.pushNamed(
            context,
            AboutFoodScreen.aboutFoodScreenName,
            arguments: new AboutRecipeArguments(recipe.id),
          ),
        );
      },
      itemCount: recipes.length,
    );
  }
}
