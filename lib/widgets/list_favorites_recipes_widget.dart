import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:otusfood/model/user.dart';

import '../arguments/about_recipe_arguments.dart';
import '../model/recipe.dart';
import '../presenters/recipes_presenter.dart';
import '../presenters/user_presenter.dart';
import '../screens/about_recipe_screen.dart';
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
  @override
  void initState() {
    User? user = widget.userPresenter.currentUser;
    if (user != null) {
      widget.recipePresenter.recipeRepository().getFavoriteRecipes(user.id);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<List<Recipe>>(
        stream: widget.recipePresenter.recipeRepository().getFavoritesRecipes(),
        builder: (builder, snapshot) {
          var _recipes = snapshot.data;
          if (_recipes == null || _recipes.isEmpty) return Container();
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: new ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
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
          );
        },
      ),
    );
  }
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback resumeCallBack;
  final AsyncCallback suspendingCallBack;

  LifecycleEventHandler({
    required this.resumeCallBack,
    required this.suspendingCallBack,
  });

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        await resumeCallBack();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        if (suspendingCallBack != null) {
          await suspendingCallBack();
        }
        break;
    }
  }
}
