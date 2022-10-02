import 'package:flutter/material.dart';
import 'package:otusfood/model/recipe_step.dart';
import 'package:otusfood/utils/app_colors.dart';

class StepWidget extends StatefulWidget {
  final RecipeStep step;
  final bool isProcessingCooking;

  StepWidget({
    required this.step,
    required this.isProcessingCooking,
  });

  @override
  _StepWidgetState createState() => _StepWidgetState();
}

class _StepWidgetState extends State<StepWidget> {
  _createWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Text(
            // TODO: widget.step.stepNumber => recipeStepLink.number
            // widget.step.stepNumber.toString(),
            '',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              color: _getTextColorForNumberStep(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            '${widget.step.name}',
            style: TextStyle(
              color: _getTextColorForDescription(),
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
            ),
          ),
        ),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TODO: isSuccess
              // Transform.scale(
              //   child: Checkbox(
              //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              //     value: widget.step.isSuccess,
              //     checkColor: AppColors.textSecondary,
              //     fillColor: MaterialStateProperty.resolveWith(_getColor),
              //     side: BorderSide(
              //       color: _getColorForCheckBoxBorder(),
              //       width: 2.5,
              //     ),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(3.125),
              //     ),
              //     onChanged: widget.isProcessingCooking
              //         ? (isChecked) {
              //             setState(() {
              //               widget.step.isSuccess = !widget.step.isSuccess;
              //             });
              //           }
              //         : null,
              //   ),
              //   scale: 1.6,
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  '${widget.step.getTimeMinute()}',
                  style: TextStyle(
                    color: _getTextColorForTime(),
                    fontSize: 13.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: _createWidget(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: _getBackgroundColor(),
      ),
    );
  }

  _getBackgroundColor() =>
      widget.isProcessingCooking ? AppColors.mainAccentTransparent : AppColors.background;

  _getTextColorForDescription() =>
      widget.isProcessingCooking ? AppColors.textCookingDescription : AppColors.inactive;

  _getTextColorForNumberStep() =>
      widget.isProcessingCooking ? AppColors.mainAccent : AppColors.inactive;

  _getTextColorForTime() =>
      widget.isProcessingCooking ? AppColors.main : AppColors.border;

  _getColorForCheckBoxBorder() =>
      widget.isProcessingCooking ? AppColors.main : AppColors.border;

  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.main;
    }
    return AppColors.main;
  }
}
