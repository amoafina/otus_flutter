import 'package:flutter/material.dart';
import 'package:otusfood/model/comment.dart';
import 'package:otusfood/model/recipe.dart';
import 'package:otusfood/utils/app_colors.dart';
import 'package:otusfood/widgets/comments_widget.dart';
import 'package:otusfood/widgets/cooking_time_info_widget.dart';
import 'package:otusfood/widgets/ingredient_widget.dart';
import 'package:otusfood/widgets/start_finish_cooking_button.dart';
import 'package:otusfood/widgets/step_widget.dart';

class AboutFoodScreen extends StatefulWidget {
  final Recipe recipe;
  final List<Comment> comments;

  AboutFoodScreen({
    required this.recipe,
    required this.comments,
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
              fontWeight: FontWeight.w400),
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
        backgroundColor:
            _isProcessingCooking ? AppColors.mainAccent : AppColors.textSecondary,
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
                        visible: true,
                        child: IconButton(
                          iconSize: 30.0,
                          icon: Icon(
                            Icons.favorite_outlined,
                            // TODO: isFavorite
                            // color: widget.recipe.isFavorite
                            //     ? AppColors.active
                            //     : AppColors.inactive,
                            color: AppColors.inactive
                          ),
                          onPressed: () {
                            setState(() {
                              // TODO: isFavorite
                              // widget.recipe.isFavorite = !widget.recipe.isFavorite;
                            });
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
                      child: Image.asset(
                        widget.recipe.getLocalPath(),
                        height: (MediaQuery.of(context).size.width - 32) / 1.79,
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width - 32,
                      ),
                    )),
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
                      itemCount: widget.recipe.recipeIngredients.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: index == 0 ? 0.0 : 8.0,
                          ),
                          child: IngredientWidget(
                            recipeIngredient: widget.recipe.recipeIngredients[index],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 19.0),
                  child: Text(
                    'Шаги приготовления',
                    style: TextStyle(
                      color: AppColors.main,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // TODO: widget.recipe.steps => RecipeStepLink
                // Padding(
                //   padding: const EdgeInsets.only(top: 19.0),
                //   child: ListView.builder(
                //       physics: NeverScrollableScrollPhysics(),
                //       shrinkWrap: true,
                //       itemCount: widget.recipe.steps.length,
                //       itemBuilder: (context, index) {
                //         return Padding(
                //           padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                //           child: StepWidget(
                //             step: widget.recipe.steps[index],
                //             isProcessingCooking: _isProcessingCooking,
                //           ),
                //         );
                //       }),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     top: 27.0,
                //   ),
                //   child: Center(
                //     child: StartFinishCookingButton(
                //       onPressedButton: () {
                //         setState(() {
                //           _scrollController.jumpTo(0);
                //           if (!_isProcessingCooking) {
                //             widget.recipe.steps.forEach((element) {
                //               element.isSuccess = false;
                //             });
                //           }
                //           _isProcessingCooking = !_isProcessingCooking;
                //         });
                //       },
                //       isProcessingCooking: _isProcessingCooking,
                //     ),
                //   ),
                // ),
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