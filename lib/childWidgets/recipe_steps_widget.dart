import 'package:flutter/cupertino.dart';
import 'package:otusfood/childWidgets/start_finish_cooking_button.dart';
import 'package:otusfood/childWidgets/step_widget.dart';

import '../model/recipe_step.dart';
import '../utils/app_colors.dart';

class RecipeStepsWidget extends StatefulWidget {
  final ScrollController scrollController;
  final List<RecipeStep> recipeSteps;


  RecipeStepsWidget({
    required this.scrollController,
    required this.recipeSteps,
  });

  @override
  _RecipeStepsState createState() => _RecipeStepsState();
}

class _RecipeStepsState extends State<RecipeStepsWidget> {
  bool _isProcessingCooking = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _createStepsWidget(),
    );
  }

  Widget _createStepsWidget() {
    if (widget.recipeSteps.isEmpty) {
      return Container();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Шаги приготовления',
            style: TextStyle(
              color: AppColors.main,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: StepWidget(
                  step: widget.recipeSteps[index],
                  isProcessingCooking: _isProcessingCooking,
                ),
              );
            },
            itemCount: widget.recipeSteps.length,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 27.0,
            ),
            child: Center(
              child: StartFinishCookingButton(
                onPressedButton: () {
                  setState(() {
                    widget.scrollController.jumpTo(0);
                    if (!_isProcessingCooking) {
                      widget.recipeSteps.forEach((step) {
                        step.isSuccess = false;
                      });
                    }
                    _isProcessingCooking = !_isProcessingCooking;
                  });
                },
                isProcessingCooking: _isProcessingCooking,
              ),
            ),
          ),
        ],
      );
    }
  }
}
