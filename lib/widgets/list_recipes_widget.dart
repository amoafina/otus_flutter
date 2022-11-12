import 'package:flutter/cupertino.dart';
import 'package:otusfood/arguments/about_recipe_arguments.dart';

import '../model/recipe.dart';
import '../presenters/recipes_presenter.dart';
import '../presenters/user_presenter.dart';
import '../screens/about_recipe_screen.dart';
import 'item_recipe_widget.dart';

class ListRecipesWidget extends StatefulWidget {
  final RecipePresenter recipePresenter;
  final UserPresenter userPresenter;

  ListRecipesWidget({
    required this.recipePresenter,
    required this.userPresenter,
  });

  @override
  State<StatefulWidget> createState() => _ListRecipesState();
}

class _ListRecipesState extends State<ListRecipesWidget> {
  List<Recipe> _recipes = [];

  _updateRecipe(List<Recipe> recipes) {
    setState(() {
      _recipes.addAll(recipes);
    });
  }

  @override
  void initState() {
    widget.recipePresenter.getRecipes().then((value) => _updateRecipe(value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 24,
          ),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, position) {
            var recipe = _recipes[position];
            return GestureDetector(
              child: ItemRecipeWidget(recipe),
              onTap: () => Navigator.pushNamed(
                context,
                AboutFoodScreen.aboutFoodScreenName,
                arguments: new AboutRecipeArguments(recipe.id),
              ),
            );
          },
          itemCount: _recipes.length,
        ),
      ),
    );
  }
}
