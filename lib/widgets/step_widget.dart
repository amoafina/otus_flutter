import 'package:flutter/material.dart';
import 'package:otusfood/utils/app_colors.dart';

import '../model/food_step.dart';

class StepWidget extends StatefulWidget {
  final FoodStep step;
  final bool isProcessingCooking;

  StepWidget({
    required this.step,
    required this.isProcessingCooking,
  });

  @override
  _StepWidgetState createState() => _StepWidgetState();
}

class _StepWidgetState extends State<StepWidget> {
  List<CrossAxisAlignment> getValues() {
    return [CrossAxisAlignment.start, CrossAxisAlignment.center];
  }

  _createWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Text(
            widget.step.numberStep.toString(),
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
            '${widget.step.description}',
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
              Transform.scale(
                child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: widget.step.isSuccessful,
                  checkColor: AppColors.textSecondary,
                  fillColor: MaterialStateProperty.resolveWith(_getColor),
                  side: BorderSide(
                    color: _getColorForCheckBoxBorder(),
                    width: 2.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.125),
                  ),
                  onChanged: widget.isProcessingCooking
                      ? (isChecked) {
                          setState(() {
                            widget.step.isSuccessful = !widget.step.isSuccessful;
                          });
                        }
                      : null,
                ),
                scale: 1.6,
              ),
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
      widget.isProcessingCooking ? AppColors.mainLighter : AppColors.background;

  _getTextColorForDescription() =>
      widget.isProcessingCooking ? AppColors.textCookingDescription : AppColors.inactive;

  _getTextColorForNumberStep() =>
      widget.isProcessingCooking ? AppColors.main : AppColors.inactive;

  _getTextColorForTime() =>
      widget.isProcessingCooking ? AppColors.mainDarker : AppColors.border;

  _getColorForCheckBoxBorder() =>
      widget.isProcessingCooking ? AppColors.mainDarker : AppColors.border;

  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.mainDarker;
    }
    return AppColors.mainDarker;
  }
}
