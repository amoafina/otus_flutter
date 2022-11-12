import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otusfood/bloc/user_bloc.dart';
import 'package:otusfood/presenters/recipes_presenter.dart';
import 'package:otusfood/screens/auth_screen.dart';
import 'package:otusfood/screens/freezer_screen.dart';
import 'package:otusfood/screens/profile_screen.dart';
import 'package:otusfood/utils/app_colors.dart';
import 'package:otusfood/widgets/list_favorites_recipes_widget.dart';
import 'package:otusfood/widgets/list_recipes_widget.dart';

class MainScreen extends StatefulWidget {
  static String mainScreenName = "/mainScreenName";
  final RecipePresenter recipePresenter;

  const MainScreen({
    required this.title,
    required this.recipePresenter,
  });

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  bool isHasUser = false;

  UserBloc? userBloc;

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: Text(message),
    ));
  }

  @override
  void initState() {
    userBloc = context.read<UserBloc>();
    userBloc?.userPresenter.getStreamMessage().listen((message) {
      if (message.isNotEmpty) {
        showInSnackBar(message);
      }
    });
    userBloc?.userPresenter.getUserStream().listen((user) {
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
          userPresenter: userBloc!.userPresenter,
          recipePresenter: widget.recipePresenter,
        );
      case 1:
        return AuthScreen(
          userPresenter: userBloc!.userPresenter,
        );
      default:
        return Container();
    }
  }

  Widget _getHasProfileBodyWidget() {
    switch (currentIndex) {
      case 0:
        return ListRecipesWidget(
          userPresenter: userBloc!.userPresenter,
          recipePresenter: widget.recipePresenter,
        );
      case 1:
        return new FreezerScreen();
      case 2:
        return new ListFavoritesRecipesWidget(
          recipePresenter: widget.recipePresenter,
          userPresenter: userBloc!.userPresenter,
        );
      default:
        return ProfileScreen(
          userPresenter: userBloc!.userPresenter,
        );
    }
  }
}
