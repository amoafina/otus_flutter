import 'package:flutter/material.dart';
import 'package:otusfood/api/food_api.dart';
import 'package:otusfood/model/ingredient.dart';
import 'package:otusfood/utils/app_colors.dart';

import '../childWidgets/ingredient_widget.dart';

class FreezerScreen extends StatefulWidget {
  @override
  _FreezerScreenState createState() => _FreezerScreenState();
}

class _FreezerScreenState extends State<FreezerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 24.0,
              ),
              width: double.infinity,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 19.0,
                        left: 23.0,
                        bottom: 9.0,
                      ),
                      child: Text(
                        'В холодильнике',
                        style: TextStyle(
                          color: AppColors.greenColorBorder,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 23.0,
                        left: 23.0,
                      ),
                      child: Column(
                        children: _createIngredients(
                          FoodApi().getIngredientsTmp(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 21,
              ),
              child: MaterialButton(
                minWidth: 232.0,
                height: 48.0,
                child: Text(
                  'Рекомендовать рецепты',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                color: AppColors.greenBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _createIngredients(List<Ingredient> ingredients) {
    if (ingredients.isEmpty) return List.empty();
    return ingredients
        .map((e) => Padding(
              padding: const EdgeInsets.only(
                bottom: 8.0,
              ),
              child: IngredientWidget(ingredient: e),
            ))
        .toList();
  }
}
