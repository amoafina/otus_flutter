import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otusfood/bloc/user_bloc.dart';
import 'package:otusfood/screens/auth_screen.dart';
import 'package:otusfood/screens/freezer_screen.dart';
import 'package:otusfood/screens/profile_screen.dart';
import 'package:otusfood/screens/recipes_screen.dart';
import 'package:otusfood/utils/app_colors.dart';

import 'favorites_recipes_screen.dart';

class MainScreen extends StatefulWidget {
  static String mainScreenName = "/mainScreenName";

  static Route createRouteMainScreen(String title) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          MainScreen(title: title),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  const MainScreen({required this.title});

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
        label: '??????????????',
      ),
    );
    widgets.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        label: '????????',
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
        label: '??????????????',
      ),
    );
    widgets.add(
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/images/ic_freezer.png"),
        ),
        backgroundColor: AppColors.background,
        label: '??????????????????????',
      ),
    );
    widgets.add(
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/images/ic_favorite.png"),
        ),
        label: '??????????????????',
      ),
    );
    widgets.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        label: '??????????????',
      ),
    );
    return widgets;
  }

  Widget _getNotProfileBodyWidget() {
    switch (currentIndex) {
      case 0:
        return RecipesScreen();
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
        return RecipesScreen();
      case 1:
        return new FreezerScreen();
      case 2:
        return new FavoritesRecipesScreen(
          userPresenter: userBloc!.userPresenter,
        );
      default:
        return ProfileScreen(
          userPresenter: userBloc!.userPresenter,
        );
    }
  }
}
