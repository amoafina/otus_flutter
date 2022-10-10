import 'package:flutter/material.dart';
import 'package:otusfood/api/food_api.dart';
import 'package:otusfood/model/recipe.dart';
import 'package:otusfood/presenters/recipes_presenter.dart';
import 'package:otusfood/screens/about_recipe_screen.dart';
import 'package:otusfood/utils/app_colors.dart';
import 'package:otusfood/utils/utils.dart';
import 'package:otusfood/widgets/auth_widget.dart';
import 'package:otusfood/widgets/item_recipe_widget.dart';
import 'package:otusfood/widgets/list_recipes_widget.dart';

import '../data/recipe_box.dart';
import '../repositories/recipes_repository.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    required this.title,
  });

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: AppColors.greenBg,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/icon_pizza.png"),
            ),
            label: 'Рецепты',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Вход',
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: _getBodyWidget(),
    );
  }

  Widget _getBodyWidget() {
    switch (currentIndex) {
      case 0:
        return ListRecipesWidget(
          recipePresenter: new RecipePresenter(
              recipeRepository: new RecipeRepository(
            foodApi: new FoodApi(),
            recipeBox: new RecipeBox(),
          )),
        );
      case 1:
        return AuthWidget();
      default:
        return Container();
    }
  }
}
