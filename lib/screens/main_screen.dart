import 'package:flutter/material.dart';
import 'package:otusfood/api/food_api.dart';
import 'package:otusfood/model/food.dart';
import 'package:otusfood/screens/about_food_screen.dart';
import 'package:otusfood/utils/app_colors.dart';
import 'package:otusfood/utils/utils.dart';
import 'package:otusfood/widgets/item_food_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  FoodApi _api = FoodApi();

  @override
  Widget build(BuildContext context) {
    List<Food> foods = _api.getFoods();
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 24),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, position) {
                var food = foods[position];
                return GestureDetector(
                  child: ItemFoodWidget(food),
                  onTap: () => {
                    Navigator.push(
                      context,
                      getRoute(
                        AboutFoodScreen(
                          food: food,
                        ),
                      ),
                    )
                  },
                );
              },
              itemCount: foods.length,
            ),
          ),
        ));
  }
}
