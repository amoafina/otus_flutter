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
    foods.add(Food(
        title: "Лосось в соусе терияки",
        time: 45,
        id: 1,
        imgLocalSource: "photo_first_recipe.png"));
    foods.add(Food(
        title: "Поке боул с сыром тофу",
        time: 30,
        id: 2,
        imgLocalSource: "photo_second_recipe.png"));
    foods.add(Food(
        title: "Стейк из говядины по-грузински с кукурузой",
        time: 75,
        id: 3,
        imgLocalSource: "photo_third_recipe.png"));
    foods.add(Food(
        title: "Тосты с голубикой и бананом",
        time: 45,
        id: 4,
        imgLocalSource: "photo_four_recipe.png"));
    foods.add(Food(
        title: "Паста с морепродуктами",
        time: 25,
        id: 5,
        imgLocalSource: "photo_five_recipe.png"));
    foods.add(Food(
        title: "Бургер с двумя котлетами",
        time: 60,
        id: 6,
        imgLocalSource: "photo_six_recipe.png"));
    foods.add(Food(
        title: "Пицца Маргарита домашняя",
        time: 25,
        id: 7,
        imgLocalSource: "photo_seven_recipe.png"));
    return foods;
  }

  @override
  Widget build(BuildContext context) {
    List<Food> foods = _generateFoods();
    return Scaffold(
        backgroundColor: '#ECECEC'.toColor(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, position) {
                return ItemFoodWidget(foods[position]);
              },
              itemCount: foods.length,
              separatorBuilder: (BuildContext context, int index) =>
                  Container(height: 24),
            ),
          ),
        ));
  }
}
