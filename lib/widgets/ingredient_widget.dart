import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otusfood/model/food_ingredient.dart';
import 'package:otusfood/utils/app_colors.dart';

class IngredientWidget extends StatelessWidget {
  final FoodIngredient foodIngredient;

  IngredientWidget({
    required this.foodIngredient,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\u2022 ${foodIngredient.description}',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
        Align(
          child: Text(
            foodIngredient.measurement,
            style: TextStyle(
              color: AppColors.inactive,
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }

}
