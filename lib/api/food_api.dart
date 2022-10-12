import 'package:flutter/material.dart';
import 'package:otusfood/model/entity_link.dart';
import 'package:otusfood/model/ingredient.dart';
import 'package:otusfood/model/recipe.dart';
import 'package:otusfood/model/recipe_ingredient.dart';
import 'package:otusfood/model/recipe_step.dart';
import 'package:otusfood/model/recipe_step_link.dart';

class FoodApi {
  Future<List<Recipe>> getRecipes() async {
    List<Recipe> foods = [];
    foods.add(
      Recipe(
          name: "Лосось в соусе терияки",
          duration: 45,
          id: 1,
          recipeStepLinks: List.empty(),
          recipeIngredients: List.empty(),
          photo: "photo_first_recipe.png",
          favoriteRecipes: []),
    );
    foods.add(Recipe(
        name: "Поке боул с сыром тофу",
        duration: 30,
        id: 2,
        recipeStepLinks: List.empty(),
        recipeIngredients: List.empty(),
        photo: "photo_second_recipe.png",
        favoriteRecipes: []));
    foods.add(Recipe(
        name: "Стейк из говядины по-грузински с кукурузой",
        duration: 75,
        id: 3,
        recipeIngredients: List.empty(),
        recipeStepLinks: List.empty(),
        photo: "photo_third_recipe.png",
        favoriteRecipes: []));
    foods.add(Recipe(
        name: "Тосты с голубикой и бананом",
        duration: 45,
        id: 4,
        recipeStepLinks: List.empty(),
        recipeIngredients: List.empty(),
        photo: "photo_four_recipe.png",
        favoriteRecipes: []));
    foods.add(Recipe(
        name: "Паста с морепродуктами",
        duration: 25,
        id: 5,
        recipeIngredients: List.empty(),
        recipeStepLinks: List.empty(),
        photo: "photo_five_recipe.png",
        favoriteRecipes: []));
    foods.add(Recipe(
        name: "Бургер с двумя котлетами",
        duration: 60,
        id: 6,
        recipeIngredients: List.empty(),
        recipeStepLinks: List.empty(),
        photo: "photo_six_recipe.png",
        favoriteRecipes: []));
    foods.add(Recipe(
        name: "Пицца Маргарита домашняя",
        duration: 25,
        id: 7,
        recipeIngredients: List.empty(),
        recipeStepLinks: List.empty(),
        photo: "photo_seven_recipe.png",
        favoriteRecipes: []));
    return foods;
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

  Future<List<Ingredient>> getIngredients(int foodId) async {
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
}
