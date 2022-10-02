import 'package:otusfood/model/recipe.dart';
import 'package:otusfood/model/recipe_ingredient.dart';
import 'package:otusfood/model/recipe_step.dart';

class FoodApi {
  List<Recipe> getRecipes() {
    List<Recipe> foods = [];
    // foods.add(
    //   Recipe(
    //       name: "Лосось в соусе терияки",
    //       duration: 45,
    //       id: 1,
    //       recipeStepLinks: _getSteps(1),
    //       recipeIngredients: _getIngredients(1),
    //       photo: "photo_first_recipe.png"),
    // );
    // foods.add(Recipe(
    //     name: "Поке боул с сыром тофу",
    //     duration: 30,
    //     id: 2,
    //     recipeStepLinks: List.empty(),
    //     recipeIngredients: List.empty(),
    //     photo: "photo_second_recipe.png"));
    // foods.add(Recipe(
    //     name: "Стейк из говядины по-грузински с кукурузой",
    //     duration: 75,
    //     id: 3,
    //     recipeIngredients: List.empty(),
    //     recipeStepLinks: List.empty(),
    //     photo: "photo_third_recipe.png"));
    // foods.add(Recipe(
    //     name: "Тосты с голубикой и бананом",
    //     duration: 45,
    //     id: 4,
    //     recipeStepLinks: List.empty(),
    //     recipeIngredients: List.empty(),
    //     photo: "photo_four_recipe.png"));
    // foods.add(Recipe(
    //     name: "Паста с морепродуктами",
    //     duration: 25,
    //     id: 5,
    //     recipeIngredients: List.empty(),
    //     recipeStepLinks: List.empty(),
    //     photo: "photo_five_recipe.png"));
    // foods.add(Recipe(
    //     name: "Бургер с двумя котлетами",
    //     duration: 60,
    //     id: 6,
    //     recipeIngredients: List.empty(),
    //     recipeStepLinks: List.empty(),
    //     photo: "photo_six_recipe.png"));
    // foods.add(Recipe(
    //     name: "Пицца Маргарита домашняя",
    //     duration: 25,
    //     id: 7,
    //     recipeIngredients: List.empty(),
    //     recipeStepLinks: List.empty(),
    //     photo: "photo_seven_recipe.png"));
    return foods;
  }

  List<RecipeStep> _getSteps(int foodId) {
    List<RecipeStep> recipeStepLinks = [];
    // steps.add(FoodStep(
    //   description:
    //       'В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.',
    //   id: 1,
    //   foodId: foodId,
    //   timeSec: 330,
    //   stepNumber: 1,
    //   isSuccess: false,
    // ));
    // steps.add(FoodStep(
    //   description:
    //       'Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.',
    //   id: foodId,
    //   foodId: 2,
    //   timeSec: 420,
    //   stepNumber: 2,
    //   isSuccess: false,
    // ));
    // steps.add(FoodStep(
    //   description:
    //       'Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.',
    //   id: 3,
    //   foodId: foodId,
    //   timeSec: 360,
    //   stepNumber: 3,
    //   isSuccess: false,
    // ));
    // steps.add(FoodStep(
    //   description:
    //       'Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.',
    //   id: 4,
    //   foodId: foodId,
    //   timeSec: 90,
    //   stepNumber: 4,
    //   isSuccess: false,
    // ));
    // steps.add(FoodStep(
    //   description:
    //       'Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.',
    //   id: 5,
    //   foodId: foodId,
    //   timeSec: 360,
    //   stepNumber: 5,
    //   isSuccess: false,
    // ));
    // steps.add(FoodStep(
    //   description:
    //       'Поставьте в разогретую до 200 °C духовку примерно на 15 минут.',
    //   id: 6,
    //   foodId: foodId,
    //   timeSec: 900,
    //   stepNumber: 6,
    //   isSuccess: false,
    // ));
    // steps.add(FoodStep(
    //   description: 'Перед подачей полейте соусом из формы и посыпьте кунжутом.',
    //   id: 7,
    //   foodId: foodId,
    //   timeSec: 240,
    //   stepNumber: 7,
    //   isSuccess: false,
    // ));
    return recipeStepLinks;
  }

  List<RecipeIngredient> _getIngredients(int foodId) {
    List<RecipeIngredient> ingredients = [];
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