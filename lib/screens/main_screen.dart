import 'package:flutter/material.dart';
import 'package:otusfood/presenters/recipes_presenter.dart';
import 'package:otusfood/utils/app_colors.dart';
import 'package:otusfood/widgets/auth_widget.dart';
import 'package:otusfood/widgets/list_favorites_recipes_widget.dart';
import 'package:otusfood/widgets/list_recipes_widget.dart';
import 'package:otusfood/widgets/profile_widget.dart';

import '../presenters/user_presenter.dart';

class MainScreen extends StatefulWidget {
  final UserPresenter userPresenter;
  final RecipePresenter recipePresenter;

  const MainScreen({
    required this.title,
    required this.userPresenter,
    required this.recipePresenter,
  });

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  bool isHasUser = false;

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: Text(message),
    ));
  }

  @override
  void initState() {
    print('main screen init state');
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
          userPresenter: widget.userPresenter,
          recipePresenter: widget.recipePresenter,
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
          userPresenter: widget.userPresenter,
          recipePresenter: widget.recipePresenter,
        );
      case 1:
        return Container();
      case 2:
        return new ListFavoritesRecipesWidget(
          recipePresenter: widget.recipePresenter,
          userPresenter: widget.userPresenter,
        );
      default:
        return ProfileWidget(
          userPresenter: widget.userPresenter,
        );
    }
  }
}
