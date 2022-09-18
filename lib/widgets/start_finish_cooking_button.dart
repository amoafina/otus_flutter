import 'package:flutter/material.dart';

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
      isProcessingCooking ? Color(0XFF165932) : Colors.white;

  ShapeBorder _getShapeForButton() => isProcessingCooking
      ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(
            color: Color(0XFF165932),
            width: 2.0,
          ))
      : RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        );

  Color _getColorForButton() =>
      isProcessingCooking ? Colors.white : Color(0XFF165932);
}
