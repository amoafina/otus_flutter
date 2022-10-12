import 'package:flutter/cupertino.dart';
import 'package:otusfood/widgets/start_finish_cooking_button.dart';
import 'package:otusfood/widgets/step_widget.dart';

import '../model/recipe_step.dart';
import '../repositories/recipe_step_repository.dart';
import '../utils/app_colors.dart';

class RecipeStepsWidget extends StatefulWidget {
  final RecipeStepRepository recipeStepRepository;
  final int recipeStepId;
  final ScrollController scrollController;

  RecipeStepsWidget({
    required this.scrollController,
    required this.recipeStepId,
    required this.recipeStepRepository,
  });

  @override
  _RecipeStepsState createState() => _RecipeStepsState();
}

class _RecipeStepsState extends State<RecipeStepsWidget> {
  final List<RecipeStep> _steps = [];
  bool _isProcessingCooking = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<RecipeStep>>(
        future: widget.recipeStepRepository.getRecipeStep(widget.recipeStepId),
        builder: (builder, snapshot) {
          var data = snapshot.data;
          if (data == null || data.isEmpty)
            return Container();
          else {
            _steps.clear();
            _steps.addAll(data);
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
                        step: data[index],
                        isProcessingCooking: _isProcessingCooking,
                      ),
                    );
                  },
                  itemCount: data.length,
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
                            _steps.forEach((step) {
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
        },
      ),
    );
  }
}
