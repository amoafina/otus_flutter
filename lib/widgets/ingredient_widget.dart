import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otusfood/model/recipe_ingredient.dart';
import 'package:otusfood/utils/app_colors.dart';

class IngredientWidget extends StatelessWidget {
  final RecipeIngredient recipeIngredient;

  IngredientWidget({
    required this.recipeIngredient,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          // TODO recipeIngredient.description => Ingredient.name
          // '\u2022 ${recipeIngredient.description}',
          '',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
        Align(
          child: Text(
            // TODO recipeIngredient.measurement => MeasureUnit.one/many/few
            // recipeIngredient.measurement,
            '',
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
