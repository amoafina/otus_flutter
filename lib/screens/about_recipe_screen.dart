import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otusfood/event/about_recipe_screen_events.dart';
import 'package:otusfood/model/ingredient.dart';
import 'package:otusfood/state/about_recipe_screen_states.dart';
import 'package:otusfood/utils/app_colors.dart';
import 'package:otusfood/widgets/add_to_favorite_widget.dart';
import 'package:otusfood/widgets/comments_widget.dart';
import 'package:otusfood/widgets/cooking_time_info_widget.dart';
import 'package:otusfood/widgets/ingredient_widget.dart';
import 'package:otusfood/widgets/recipe_steps_widget.dart';

import '../bloc/about_recipe_screen_bloc.dart';

class AboutFoodScreen extends StatefulWidget {
  static String aboutFoodScreenName = "/aboutFoodScreenName";

  static Route createRouteToAboutRecipeScreen(int recipeId) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => AboutFoodScreen(
        recipeId: recipeId,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
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

  final int recipeId;

  AboutFoodScreen({
    required this.recipeId,
  });

  @override
  State<AboutFoodScreen> createState() {
    return _AboutFoodScreenState();
  }
}

class _AboutFoodScreenState extends State<AboutFoodScreen> {
  bool _isProcessingCooking = false;
  final ScrollController _scrollController = ScrollController();
  late AboutRecipeScreenBloc _recipeScreenBloc;

  @override
  void initState() {
    _recipeScreenBloc = context.read<AboutRecipeScreenBloc>();
    _recipeScreenBloc.add(RecipeInformationRequested(widget.recipeId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: AppColors.textPrimary,
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'Рецепт',
          style: TextStyle(
            fontSize: 20.0,
            color: AppColors.main,
            fontWeight: FontWeight.w400,
          ),
        ),
        bottom: _isProcessingCooking
            ? PreferredSize(
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Таймер',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '38:59',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w900,
                          fontSize: 24.0,
                        ),
                      )
                    ],
                  ),
                  height: 59.0,
                ),
                preferredSize: Size.fromHeight(59),
              )
            : null,
        centerTitle: true,
        backgroundColor: _isProcessingCooking
            ? AppColors.mainAccent
            : AppColors.textSecondary,
        actions: [
          IconButton(
            color: AppColors.textPrimary,
            onPressed: () {},
            icon: Image.asset('assets/images/ic_megafon.png'),
          )
        ],
      ),
      backgroundColor: AppColors.textSecondary,
      body: BlocBuilder<AboutRecipeScreenBloc, AboutRecipeScreenState>(
        bloc: _recipeScreenBloc,
        builder: (builder, state) {
          if (state is LoadingRecipeInformation) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ShowInformationRecipe) {
            return new SafeArea(
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: ScrollPhysics(),
                child: Container(
                  margin: const EdgeInsets.only(left: 17.0, right: 17.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 27.6),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                state.recipe.name,
                                maxLines: 4,
                                style: TextStyle(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24.0,
                                ),
                              ),
                            ),
                            Visibility(
                              visible:
                                  _recipeScreenBloc.userPresenter.currentUser !=
                                      null,
                              child: AddToFavoriteWidget(
                                user:
                                    _recipeScreenBloc.userPresenter.currentUser,
                                recipeId: widget.recipeId,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: CookingTimeInfoWidget(
                          cookingTime: state.recipe.getTimeValue(),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              imageUrl: state.recipe.getNetworkPath(),
                              height: (MediaQuery.of(context).size.width - 32) /
                                  1.79,
                              width: MediaQuery.of(context).size.width - 32,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          )),
                      _createIngredientsWidget(state.ingredients),
                      Padding(
                        padding: const EdgeInsets.only(top: 19.0),
                        child: new RecipeStepsWidget(
                          scrollController: _scrollController,
                          recipeSteps: state.recipeSteps,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          bottom: 37.0,
                        ),
                        child: CommentsWidget(
                          recipeId: widget.recipeId,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _createIngredientsWidget(List<Ingredient> ingredients) {
    if (ingredients.isEmpty) {
      return Container();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 22.54,
            ),
            child: Text(
              'Ингредиенты',
              style: TextStyle(
                color: AppColors.main,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 18.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.border,
                width: 3.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 15.0,
              ),
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 0.0 : 8.0,
                  ),
                  child: IngredientWidget(
                    ingredient: ingredients[index],
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }
}
