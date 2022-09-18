import 'package:flutter/material.dart';

import '../model/food_step.dart' as stp;

class StepWidget extends StatelessWidget {
  final stp.FoodStep step;
  final bool isProcessingCooking;

  StepWidget({
    required this.step,
    required this.isProcessingCooking,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: double.infinity,
      child: Center(
        child: ListTile(
          leading: Text(
            step.numberStep.toString(),
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              color: Color(0XFFC2C2C2),
            ),
          ),
          title: Text(
            '${step.description}',
            style: TextStyle(
              color: Color(0XFF797676),
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: false,
                side: BorderSide(
                  color: Color(0XFF797676),
                  width: 4.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                onChanged: isProcessingCooking ? (isChecked) {} : null,
              ),
              Text(
                '${step.getTimeMinute()}',
                style: TextStyle(
                  color: Color(0XFF797676),
                  fontSize: 13.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xFFECECEC),
      ),
    );
  }
}
