import 'package:flutter/cupertino.dart';
import 'package:otusfood/api/food_api.dart';
import 'package:otusfood/data/ingredients_box.dart';
import 'package:otusfood/data/recipe_step_box.dart';
import 'package:otusfood/repositories/ingredients_repository.dart';
import 'package:otusfood/repositories/recipe_step_repository.dart';

import '../model/recipe.dart';
import '../presenters/recipes_presenter.dart';
import '../screens/about_recipe_screen.dart';
import '../utils/utils.dart';
import 'item_recipe_widget.dart';

class ListRecipesWidget extends StatefulWidget {
  final RecipePresenter recipePresenter;

  ListRecipesWidget({
    required this.recipePresenter,
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 24),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, position) {
            var recipe = _recipes[position];
            return GestureDetector(
              child: ItemRecipeWidget(recipe),
              onTap: () => {
                Navigator.push(
                  context,
                  getRoute(
                    AboutFoodScreen(
                      recipeStepRepository: new RecipeStepRepository(
                        foodApi: new FoodApi(),
                        baseBox: new RecipeStepBox(),
                      ),
                      recipe: recipe,
                      comments: [],
                      ingredientRepository: new IngredientsRepository(
                        foodApi: new FoodApi(),
                        ingredientsBox: new IngredientsBox(),
                      ),
                    ),
                  ),
                )
              },
            );
          },
          itemCount: _recipes.length,
        ),
      ),
    );
  }
}
