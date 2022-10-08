import 'package:flutter/material.dart';
import 'package:otusfood/api/food_api.dart';
import 'package:otusfood/model/recipe.dart';
import 'package:otusfood/presenters/recipes_presenter.dart';
import 'package:otusfood/screens/about_recipe_screen.dart';
import 'package:otusfood/utils/app_colors.dart';
import 'package:otusfood/utils/utils.dart';
import 'package:otusfood/widgets/item_recipe_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
    required this.title,
    required this.recipePresenter,
  }) : super(key: key);

  final String title;
  final RecipePresenter recipePresenter;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
                          recipe: recipe,
                          comments: [],
                        ),
                      ),
                    )
                  },
                );
              },
              itemCount: _recipes.length,
            ),
          ),
        ));
  }
}
