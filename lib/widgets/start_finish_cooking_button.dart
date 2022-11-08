import 'package:flutter/material.dart';
import 'package:otusfood/utils/app_colors.dart';

class StartFinishCookingButton extends StatelessWidget {
  final bool isProcessingCooking;
  final Function onPressedButton;

  StartFinishCookingButton({
    required this.isProcessingCooking,
    required this.onPressedButton,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 232.0,
      height: 48.0,
      child: Text(
        _getTextForButton(),
        style: TextStyle(
          color: _getTextColorForButton(),
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ),
      color: _getColorForButton(),
      shape: _getShapeForButton(),
      onPressed: () {
        onPressedButton();
      },
    );
  }

  String _getTextForButton() =>
      isProcessingCooking ? "Закончить готовить" : "Начать готовить";

  Color _getTextColorForButton() =>
      isProcessingCooking ? AppColors.main : AppColors.textSecondary;

  ShapeBorder _getShapeForButton() => isProcessingCooking
      ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(
            color: AppColors.main,
            width: 2.0,
          ),
        )
      : RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        );

  Color _getColorForButton() =>
      isProcessingCooking ? AppColors.textSecondary : AppColors.main;
}
