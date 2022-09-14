import 'package:flutter/material.dart';
import 'package:otusfood/item_food_widget.dart';
import 'package:otusfood/model/food.dart';
import 'package:otusfood/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Food> _generateFoods() {
    List<Food> foods = [];
    foods.add(Food("Лосось в соусе терияки", 45, 1, "photo_first_recipe.png"));
    foods.add(Food("Поке боул с сыром тофу", 30, 2, "photo_second_recipe.png"));
    foods.add(Food("Стейк из говядины по-грузински с кукурузой", 75, 3,
        "photo_third_recipe.png"));
    foods.add(
        Food("Тосты с голубикой и бананом", 45, 4, "photo_four_recipe.png"));
    foods.add(Food("Паста с морепродуктами", 25, 5, "photo_five_recipe.png"));
    foods.add(Food("Бургер с двумя котлетами", 60, 6, "photo_six_recipe.png"));
    foods
        .add(Food("Пицца Маргарита домашняя", 25, 7, "photo_seven_recipe.png"));
    return foods;
  }

  @override
  Widget build(BuildContext context) {
    List<Food> foods = _generateFoods();
    return Scaffold(
      backgroundColor: '#ECECEC'.toColor(),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, position) {
          return ItemFoodWidget(foods[position]);
        },
        itemCount: foods.length,
      ),
    );
  }
}
