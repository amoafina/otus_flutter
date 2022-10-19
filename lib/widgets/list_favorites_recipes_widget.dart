import 'package:flutter/cupertino.dart';
import 'package:otusfood/model/user.dart';

import '../api/food_api.dart';
import '../data/ingredients_box.dart';
import '../data/recipe_step_box.dart';
import '../model/recipe.dart';
import '../presenters/recipes_presenter.dart';
import '../presenters/user_presenter.dart';
import '../repositories/ingredients_repository.dart';
import '../repositories/recipe_step_repository.dart';
import '../screens/about_recipe_screen.dart';
import '../utils/utils.dart';
import 'item_recipe_widget.dart';

class ListFavoritesRecipesWidget extends StatefulWidget {
  final RecipePresenter recipePresenter;
  final UserPresenter userPresenter;

  ListFavoritesRecipesWidget({
    required this.recipePresenter,
    required this.userPresenter,
  });

  @override
  State<StatefulWidget> createState() => _ListFavoritesRecipesState();
}

class _ListFavoritesRecipesState extends State<ListFavoritesRecipesWidget> {
  List<Recipe> _recipes = [];

  _updateRecipe(List<Recipe> recipes) {
    setState(() {
      _recipes.addAll(recipes);
    });
  }

  @override
  void initState() {
    User? user = widget.userPresenter.currentUser;
    if (user != null) {
      widget.recipePresenter
          .getFavoriteRecipes(user.id)
          .then((value) => _updateRecipe(value));
    }
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
              onTap: () => {
                Navigator.push(
                  context,
                  getRoute(
                    AboutFoodScreen(
                      recipeRepository:
                          widget.recipePresenter.recipeRepository(),
                      userPresenter: widget.userPresenter,
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
