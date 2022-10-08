import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otusfood/model/favorite.dart';
import 'package:otusfood/model/recipe.dart';
import 'package:otusfood/model/recipe_ingredient.dart';
import 'package:otusfood/model/recipe_step_link.dart';
import 'package:otusfood/utils/app_colors.dart';
import 'package:otusfood/widgets/auth_widget.dart';

void main() {
  Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  Hive.registerAdapter(RecipeStepLinkAdapter());
  Hive.registerAdapter(FavoriteAdapter());
  Hive.registerAdapter(RecipeIngredientAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otus Food',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AuthWidget(),
      ),
      theme: ThemeData(
        primarySwatch: AppColors.themeColor,
      ),
    );
  }
}
