import 'package:dio/dio.dart';
import 'package:otusfood/model/entity_link.dart';
import 'package:otusfood/model/error_operation.dart';
import 'package:otusfood/model/favorite.dart';
import 'package:otusfood/model/ingredient.dart';
import 'package:otusfood/model/recipe.dart';
import 'package:otusfood/model/recipe_ingredient.dart';
import 'package:otusfood/model/recipe_step.dart';
import 'package:otusfood/model/recipe_step_link.dart';
import 'package:otusfood/model/success_operation.dart';

import '../model/result_operation.dart';

class FoodApi {
  final Dio dio = Dio(new BaseOptions(
    baseUrl: "http://foodapi.dzolotov.tech",
  ));

  Future<List<Recipe>> getRecipes() async {
    final response = await dio.get('/recipe');
    if (response.statusCode != null) {
      if (response.statusCode! >= 400) {
        return List.empty();
      } else {
        var json = response.data;
        print('json: $json');
        List<Recipe> recipes =
            (response.data as List).map((e) => Recipe.fromJson(e)).toList();
        print("recipes: ${recipes.length}");
        return recipes;
      }
    }
    return List.empty();
  }

  Future<Recipe?> getRecipeById(int recipeId) async {
    final response = await dio.get('/recipe/$recipeId');
    if (response.statusCode != null) {
      if (response.statusCode! >= 400) {
        return null;
      } else {
        var json = response.data;
        print('json: $json');
        Recipe recipe =
            Recipe.fromJson((response.data as Map<String, dynamic>));
        return recipe;
      }
    }
    return null;
  }

  List<Ingredient> getIngredientsTmp() {
    List<Ingredient> ingredients = [];
    ingredients.add(new Ingredient(
      id: 1,
      name: 'Соевый соус',
      measureUnit: new EntityLink(id: 1),
      recipeIngredients: [
        new RecipeIngredient(
          id: 1,
          count: 1,
          ingredient: new EntityLink(id: 1),
          recipe: new EntityLink(id: 1),
        ),
        new RecipeIngredient(
          id: 1,
          count: 1,
          ingredient: new EntityLink(id: 1),
          recipe: new EntityLink(id: 2),
        ),
      ],
      ingredientFreezer: List.empty(),
    ));
    ingredients.add(new Ingredient(
      id: 1,
      name: 'Вода',
      measureUnit: new EntityLink(id: 1),
      recipeIngredients: [
        new RecipeIngredient(
          id: 1,
          count: 1,
          ingredient: new EntityLink(id: 4),
          recipe: new EntityLink(id: 1),
        ),
        new RecipeIngredient(
          id: 1,
          count: 1,
          ingredient: new EntityLink(id: 1),
          recipe: new EntityLink(id: 5),
        ),
      ],
      ingredientFreezer: List.empty(),
    ));
    // ingredients.add(RecipeIngredient(
    //     id: 1,
    //     foodId: foodId,
    //     description: 'Соевый соус',
    //     measurement: '8 ст. ложек'));
    // ingredients.add(RecipeIngredient(
    //     id: 1,
    //     foodId: foodId,
    //     description: 'Вода',
    //     measurement: '8 ст. ложек'));
    // ingredients.add(RecipeIngredient(
    //     id: 1, foodId: foodId, description: 'Мёд', measurement: '3 ст. ложки'));
    // ingredients.add(RecipeIngredient(
    //     id: 1,
    //     foodId: foodId,
    //     description: 'Коричневый сахар',
    //     measurement: '2 ст. ложки'));
    // ingredients.add(RecipeIngredient(
    //     id: 1,
    //     foodId: foodId,
    //     description: 'Чеснок',
    //     measurement: '3 зубчика'));
    // ingredients.add(RecipeIngredient(
    //     id: 1,
    //     foodId: foodId,
    //     description: 'Тёртый свежий имбирь',
    //     measurement: '1 ст. ложка'));
    // ingredients.add(RecipeIngredient(
    //     id: 1,
    //     foodId: foodId,
    //     description: 'Лимонный сок',
    //     measurement: '1¹⁄₂ ст. ложки'));
    // ingredients.add(RecipeIngredient(
    //     id: 1,
    //     foodId: foodId,
    //     description: 'Кукурузный крахмал',
    //     measurement: '1 ст. ложка'));
    // ingredients.add(RecipeIngredient(
    //     id: 1,
    //     foodId: foodId,
    //     description: 'Растительное масло',
    //     measurement: '1 ч. ложка'));
    // ingredients.add(RecipeIngredient(
    //     id: 1,
    //     foodId: foodId,
    //     description: 'Филе лосося или сёмги',
    //     measurement: '680 г'));
    // ingredients.add(RecipeIngredient(
    //     id: 1, foodId: foodId, description: 'Кунжут', measurement: 'по вкусу'));
    return ingredients;
  }

  Future<List<Ingredient>> getIngredients() async {
    final response = await dio.get('/ingredient');
    if (response.statusCode != null) {
      if (response.statusCode! >= 400) {
        return List.empty();
      } else {
        var json = response.data;
        print('json: $json');
        var list = response.data as List;
        if (list.isEmpty) return List.empty();
        List<Ingredient> ingredients =
            list.map((e) => Ingredient.fromJson(e)).toList();
        print("ingredients: ${ingredients.length}");
        return ingredients;
      }
    }
    return List.empty();
  }

  List<RecipeStep> getSteps(int recipeId) {
    List<RecipeStep> recipeStepLinks = [];
    recipeStepLinks.add(
      new RecipeStep(
        id: 1,
        name:
            'В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.',
        duration: 330,
        recipeStepLinks: [
          new RecipeStepLink(
            id: 1,
            number: 1,
            recipe: new EntityLink(id: 1),
            step: new EntityLink(id: 1),
          ),
        ],
      ),
    );
    recipeStepLinks.add(
      new RecipeStep(
        id: 2,
        name:
            'Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.',
        duration: 420,
        recipeStepLinks: [
          new RecipeStepLink(
            id: 2,
            number: 2,
            recipe: new EntityLink(id: 1),
            step: new EntityLink(id: 2),
          ),
        ],
      ),
    );
    recipeStepLinks.add(
      new RecipeStep(
        id: 3,
        name:
            'Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.',
        duration: 360,
        recipeStepLinks: [
          new RecipeStepLink(
            id: 3,
            number: 3,
            recipe: new EntityLink(id: 1),
            step: new EntityLink(id: 3),
          ),
        ],
      ),
    );

    recipeStepLinks.add(
      new RecipeStep(
        id: 4,
        name:
            'Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.',
        duration: 90,
        recipeStepLinks: [
          new RecipeStepLink(
            id: 4,
            number: 4,
            recipe: new EntityLink(id: 1),
            step: new EntityLink(id: 4),
          ),
        ],
      ),
    );

    recipeStepLinks.add(
      new RecipeStep(
        id: 5,
        name: 'Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.',
        duration: 360,
        recipeStepLinks: [
          new RecipeStepLink(
            id: 5,
            number: 5,
            recipe: new EntityLink(id: 1),
            step: new EntityLink(id: 5),
          ),
        ],
      ),
    );

    recipeStepLinks.add(
      new RecipeStep(
        id: 6,
        name: 'Поставьте в разогретую до 200 °C духовку примерно на 15 минут.',
        duration: 900,
        recipeStepLinks: [
          new RecipeStepLink(
            id: 6,
            number: 6,
            recipe: new EntityLink(id: 1),
            step: new EntityLink(id: 6),
          ),
        ],
      ),
    );

    recipeStepLinks.add(
      new RecipeStep(
        id: 7,
        name: 'Перед подачей полейте соусом из формы и посыпьте кунжутом.',
        duration: 240,
        recipeStepLinks: [
          new RecipeStepLink(
            id: 7,
            number: 7,
            recipe: new EntityLink(id: 1),
            step: new EntityLink(id: 7),
          ),
        ],
      ),
    );
    return recipeStepLinks;
  }

  // Future<List<Ingredient>> getIngredients(int foodId) async {
  //   List<Ingredient> ingredients = [];
  //   ingredients.add(new Ingredient(
  //     id: 1,
  //     name: 'Соевый соус',
  //     measureUnit: new EntityLink(id: 1),
  //     recipeIngredients: [
  //       new RecipeIngredient(
  //         id: 1,
  //         count: 1,
  //         ingredient: new EntityLink(id: 1),
  //         recipe: new EntityLink(id: 1),
  //       ),
  //       new RecipeIngredient(
  //         id: 1,
  //         count: 1,
  //         ingredient: new EntityLink(id: 1),
  //         recipe: new EntityLink(id: 2),
  //       ),
  //     ],
  //     ingredientFreezer: List.empty(),
  //   ));
  //   ingredients.add(new Ingredient(
  //     id: 1,
  //     name: 'Вода',
  //     measureUnit: new EntityLink(id: 1),
  //     recipeIngredients: [
  //       new RecipeIngredient(
  //         id: 1,
  //         count: 1,
  //         ingredient: new EntityLink(id: 4),
  //         recipe: new EntityLink(id: 1),
  //       ),
  //       new RecipeIngredient(
  //         id: 1,
  //         count: 1,
  //         ingredient: new EntityLink(id: 1),
  //         recipe: new EntityLink(id: 5),
  //       ),
  //     ],
  //     ingredientFreezer: List.empty(),
  //   ));
  //   // ingredients.add(RecipeIngredient(
  //   //     id: 1,
  //   //     foodId: foodId,
  //   //     description: 'Соевый соус',
  //   //     measurement: '8 ст. ложек'));
  //   // ingredients.add(RecipeIngredient(
  //   //     id: 1,
  //   //     foodId: foodId,
  //   //     description: 'Вода',
  //   //     measurement: '8 ст. ложек'));
  //   // ingredients.add(RecipeIngredient(
  //   //     id: 1, foodId: foodId, description: 'Мёд', measurement: '3 ст. ложки'));
  //   // ingredients.add(RecipeIngredient(
  //   //     id: 1,
  //   //     foodId: foodId,
  //   //     description: 'Коричневый сахар',
  //   //     measurement: '2 ст. ложки'));
  //   // ingredients.add(RecipeIngredient(
  //   //     id: 1,
  //   //     foodId: foodId,
  //   //     description: 'Чеснок',
  //   //     measurement: '3 зубчика'));
  //   // ingredients.add(RecipeIngredient(
  //   //     id: 1,
  //   //     foodId: foodId,
  //   //     description: 'Тёртый свежий имбирь',
  //   //     measurement: '1 ст. ложка'));
  //   // ingredients.add(RecipeIngredient(
  //   //     id: 1,
  //   //     foodId: foodId,
  //   //     description: 'Лимонный сок',
  //   //     measurement: '1¹⁄₂ ст. ложки'));
  //   // ingredients.add(RecipeIngredient(
  //   //     id: 1,
  //   //     foodId: foodId,
  //   //     description: 'Кукурузный крахмал',
  //   //     measurement: '1 ст. ложка'));
  //   // ingredients.add(RecipeIngredient(
  //   //     id: 1,
  //   //     foodId: foodId,
  //   //     description: 'Растительное масло',
  //   //     measurement: '1 ч. ложка'));
  //   // ingredients.add(RecipeIngredient(
  //   //     id: 1,
  //   //     foodId: foodId,
  //   //     description: 'Филе лосося или сёмги',
  //   //     measurement: '680 г'));
  //   // ingredients.add(RecipeIngredient(
  //   //     id: 1, foodId: foodId, description: 'Кунжут', measurement: 'по вкусу'));
  //   return ingredients;
  // }

  Future<List<Favorite>> getFavorite() async {
    return List.empty();
  }

  Future<ResultOperation> registerUser(String login, String password) async {
    String data = "{"
        "\"id\": 0, "
        "\"token\": \"\", "
        "\"login\": \"$login\", "
        "\"password\": \"$password\", "
        "}";
    final response = await dio.post(
      '/user',
      data: data,
    );
    if (response.statusCode == null || response.statusCode! >= 400) {
      return ErrorOperation(message: response.data);
    } else {
      return SuccessOperation(object: response.data);
    }
  }
}
