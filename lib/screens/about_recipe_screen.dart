import 'package:flutter/material.dart';
import 'package:otusfood/model/comment.dart';
import 'package:otusfood/model/ingredient.dart';
import 'package:otusfood/model/recipe.dart';
import 'package:otusfood/model/user.dart';
import 'package:otusfood/utils/app_colors.dart';
import 'package:otusfood/widgets/comments_widget.dart';
import 'package:otusfood/widgets/cooking_time_info_widget.dart';
import 'package:otusfood/widgets/ingredient_widget.dart';
import 'package:otusfood/widgets/recipe_steps_widget.dart';

import '../presenters/user_presenter.dart';
import '../repositories/ingredients_repository.dart';
import '../repositories/recipe_step_repository.dart';
import '../repositories/recipes_repository.dart';

class AboutFoodScreen extends StatefulWidget {
  final Recipe recipe;
  final List<Comment> comments;
  final IngredientsRepository ingredientRepository;
  final RecipeStepRepository recipeStepRepository;
  final UserPresenter userPresenter;
  final RecipeRepository recipeRepository;

  AboutFoodScreen({
    required this.recipe,
    required this.comments,
    required this.ingredientRepository,
    required this.recipeStepRepository,
    required this.userPresenter,
    required this.recipeRepository,
  });

  @override
  State<AboutFoodScreen> createState() {
    return _AboutFoodScreenState();
  }
}

class _AboutFoodScreenState extends State<AboutFoodScreen> {
  bool _isProcessingCooking = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    User? user = widget.userPresenter.currentUser;
    if (user != null) {
      widget.recipeRepository.refresh(
        widget.recipe.id,
        user.id,
      );
    }
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
      body: SafeArea(
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
                          widget.recipe.name,
                          maxLines: 4,
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.userPresenter.currentUser != null,
                        child: StreamBuilder<bool>(
                          stream:
                              widget.recipeRepository.getIsFavoriteUserRecipe(),
                          builder: (builder, snapshot) {
                            bool isFavorite = snapshot.data ?? false;
                            return IconButton(
                              iconSize: 30.0,
                              icon: Icon(
                                Icons.favorite_outlined,
                                color: isFavorite
                                    ? AppColors.active
                                    : AppColors.inactive,
                              ),
                              onPressed: () {
                                User? user = widget.userPresenter.currentUser;
                                if (user != null) {
                                  if (isFavorite) {
                                    widget.recipeRepository.removeFavorite(
                                      widget.recipe.id,
                                      user.id,
                                    );
                                  } else {
                                    widget.recipeRepository.addFavorite(
                                      widget.recipe.id,
                                      user.id,
                                    );
                                  }
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: CookingTimeInfoWidget(
                    cookingTime: widget.recipe.getTimeValue(),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget.recipe.getNetworkPath(),
                        height: (MediaQuery.of(context).size.width - 32) / 1.79,
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width - 32,
                      ),
                    )),
                FutureBuilder<List<Ingredient>>(
                  future: widget.ingredientRepository
                      .getIngredients(widget.recipe.id),
                  builder: (context, snapshot) {
                    var list = snapshot.data;
                    if (list == null || list.isEmpty)
                      return Container();
                    else {
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 15.0,
                              ),
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    top: index == 0 ? 0.0 : 8.0,
                                  ),
                                  child: IngredientWidget(
                                    ingredient: list[index],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 19.0),
                  child: new RecipeStepsWidget(
                    scrollController: _scrollController,
                    recipeStepId: widget.recipe.id,
                    recipeStepRepository: widget.recipeStepRepository,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                    bottom: 37.0,
                  ),
                  child: CommentsWidget(
                    comments: widget.comments,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
