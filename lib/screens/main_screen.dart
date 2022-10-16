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
import 'package:otusfood/widgets/profile_widget.dart';

import '../data/recipe_box.dart';
import '../presenters/user_presenter.dart';
import '../repositories/recipes_repository.dart';

class MainScreen extends StatefulWidget {
  final UserPresenter userPresenter;

  const MainScreen({
    required this.title,
    required this.userPresenter,
  });

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  bool isHasUser = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: Text(message),
    ));
  }

  @override
  void initState() {
    widget.userPresenter.getUserStream().listen((user) {
      if (user == null) {
        if (isHasUser) {
          setState(() {
            currentIndex = 1;
            isHasUser = false;
          });
        }
      } else {
        setState(() {
          currentIndex = 0;
          isHasUser = true;
        });
      }
    });
    widget.userPresenter.getStreamMessage().listen((message) {
      if (message.isNotEmpty) {
        showInSnackBar(message);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedItemColor: AppColors.grayApp,
        selectedItemColor: AppColors.greenBg,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: isHasUser
            ? _createHasProfileBottomNavigationItems()
            : _createHasNotProfileBottomNavigationItems(),
      ),
      backgroundColor: AppColors.background,
      body: isHasUser ? _getHasProfileBodyWidget() : _getNotProfileBodyWidget(),
    );
  }

  List<BottomNavigationBarItem> _createHasNotProfileBottomNavigationItems() {
    List<BottomNavigationBarItem> widgets = [];
    widgets.add(
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/images/icon_pizza.png"),
        ),
        label: 'Рецепты',
      ),
    );
    widgets.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        label: 'Вход',
      ),
    );
    return widgets;
  }

  List<BottomNavigationBarItem> _createHasProfileBottomNavigationItems() {
    List<BottomNavigationBarItem> widgets = [];
    widgets.add(
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/images/icon_pizza.png"),
        ),
        label: 'Рецепты',
      ),
    );
    widgets.add(
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/images/ic_freezer.png"),
        ),
        backgroundColor: AppColors.background,
        label: 'Холодильник',
      ),
    );
    widgets.add(
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/images/ic_favorite.png"),
        ),
        label: 'Избранное',
      ),
    );
    widgets.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        label: 'Профиль',
      ),
    );
    return widgets;
  }

  Widget _getNotProfileBodyWidget() {
    switch (currentIndex) {
      case 0:
        return ListRecipesWidget(
          recipePresenter: new RecipePresenter(
            recipeRepository: new RecipeRepository(
              foodApi: new FoodApi(),
              recipeBox: new RecipeBox(),
            ),
          ),
        );
      case 1:
        return AuthWidget(
          userPresenter: widget.userPresenter,
        );
      default:
        return Container();
    }
  }

  Widget _getHasProfileBodyWidget() {
    switch (currentIndex) {
      case 0:
        return ListRecipesWidget(
          recipePresenter: new RecipePresenter(
            recipeRepository: new RecipeRepository(
              foodApi: new FoodApi(),
              recipeBox: new RecipeBox(),
            ),
          ),
        );
      case 1:
        return Container();
      case 2:
        return Container();
      default:
        return ProfileWidget(
          userPresenter: widget.userPresenter,
        );
    }
  }
}
