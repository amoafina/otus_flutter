import 'package:flutter/material.dart';

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
                  checkColor: Colors.white,
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
      widget.isProcessingCooking ? Color(0x262ECC71) : Color(0XFFECECEC);

  _getTextColorForDescription() =>
      widget.isProcessingCooking ? Color(0xFF2D490C) : Color(0XFF797676);

  _getTextColorForNumberStep() =>
      widget.isProcessingCooking ? Color(0xFF2ECC71) : Color(0XFFC2C2C2);

  _getTextColorForTime() =>
      widget.isProcessingCooking ? Color(0xFF165932) : Color(0XFF797676);

  _getColorForCheckBoxBorder() =>
      widget.isProcessingCooking ? Color(0xFF165932) : Color(0XFF797676);

  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color(0xFF165932);
    }
    return Color(0xFF165932);
  }
}
