import 'package:otusfood/model/food.dart';
import 'package:otusfood/model/food_ingredient.dart';
import 'package:otusfood/model/food_step.dart';

class FoodApi {
  List<Food> getFoods() {
    List<Food> foods = [];
    foods.add(
      Food(
          title: "Лосось в соусе терияки",
          time: 45,
          id: 1,
          steps: _getSteps(1),
          ingredients: _getIngredients(1),
          imgLocalSource: "photo_first_recipe.png"),
    );
    foods.add(Food(
        title: "Поке боул с сыром тофу",
        time: 30,
        id: 2,
        steps: List.empty(),
        ingredients: List.empty(),
        imgLocalSource: "photo_second_recipe.png"));
    foods.add(Food(
        title: "Стейк из говядины по-грузински с кукурузой",
        time: 75,
        id: 3,
        ingredients: List.empty(),
        steps: List.empty(),
        imgLocalSource: "photo_third_recipe.png"));
    foods.add(Food(
        title: "Тосты с голубикой и бананом",
        time: 45,
        id: 4,
        steps: List.empty(),
        ingredients: List.empty(),
        imgLocalSource: "photo_four_recipe.png"));
    foods.add(Food(
        title: "Паста с морепродуктами",
        time: 25,
        id: 5,
        ingredients: List.empty(),
        steps: List.empty(),
        imgLocalSource: "photo_five_recipe.png"));
    foods.add(Food(
        title: "Бургер с двумя котлетами",
        time: 60,
        id: 6,
        ingredients: List.empty(),
        steps: List.empty(),
        imgLocalSource: "photo_six_recipe.png"));
    foods.add(Food(
        title: "Пицца Маргарита домашняя",
        time: 25,
        id: 7,
        ingredients: List.empty(),
        steps: List.empty(),
        imgLocalSource: "photo_seven_recipe.png"));
    return foods;
  }

  List<FoodStep> _getSteps(int foodId) {
    List<FoodStep> steps = [];
    steps.add(FoodStep(
      description:
          'В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.',
      id: 1,
      foodId: foodId,
      timeSec: 330,
      stepNumber: 1,
      isSuccess: false,
    ));
    steps.add(FoodStep(
      description:
          'Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.',
      id: foodId,
      foodId: 2,
      timeSec: 420,
      stepNumber: 2,
      isSuccess: false,
    ));
    steps.add(FoodStep(
      description:
          'Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.',
      id: 3,
      foodId: foodId,
      timeSec: 360,
      stepNumber: 3,
      isSuccess: false,
    ));
    steps.add(FoodStep(
      description:
          'Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.',
      id: 4,
      foodId: foodId,
      timeSec: 90,
      stepNumber: 4,
      isSuccess: false,
    ));
    steps.add(FoodStep(
      description:
          'Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.',
      id: 5,
      foodId: foodId,
      timeSec: 360,
      stepNumber: 5,
      isSuccess: false,
    ));
    steps.add(FoodStep(
      description:
          'Поставьте в разогретую до 200 °C духовку примерно на 15 минут.',
      id: 6,
      foodId: foodId,
      timeSec: 900,
      stepNumber: 6,
      isSuccess: false,
    ));
    steps.add(FoodStep(
      description: 'Перед подачей полейте соусом из формы и посыпьте кунжутом.',
      id: 7,
      foodId: foodId,
      timeSec: 240,
      stepNumber: 7,
      isSuccess: false,
    ));
    return steps;
  }

  List<FoodIngredient> _getIngredients(int foodId) {
    List<FoodIngredient> ingredients = [];
    ingredients.add(FoodIngredient(
        id: 1,
        foodId: foodId,
        description: 'Соевый соус',
        measurement: '8 ст. ложек'));
    ingredients.add(FoodIngredient(
        id: 1,
        foodId: foodId,
        description: 'Вода',
        measurement: '8 ст. ложек'));
    ingredients.add(FoodIngredient(
        id: 1, foodId: foodId, description: 'Мёд', measurement: '3 ст. ложки'));
    ingredients.add(FoodIngredient(
        id: 1,
        foodId: foodId,
        description: 'Коричневый сахар',
        measurement: '2 ст. ложки'));
    ingredients.add(FoodIngredient(
        id: 1,
        foodId: foodId,
        description: 'Чеснок',
        measurement: '3 зубчика'));
    ingredients.add(FoodIngredient(
        id: 1,
        foodId: foodId,
        description: 'Тёртый свежий имбирь',
        measurement: '1 ст. ложка'));
    ingredients.add(FoodIngredient(
        id: 1,
        foodId: foodId,
        description: 'Лимонный сок',
        measurement: '1¹⁄₂ ст. ложки'));
    ingredients.add(FoodIngredient(
        id: 1,
        foodId: foodId,
        description: 'Кукурузный крахмал',
        measurement: '1 ст. ложка'));
    ingredients.add(FoodIngredient(
        id: 1,
        foodId: foodId,
        description: 'Растительное масло',
        measurement: '1 ч. ложка'));
    ingredients.add(FoodIngredient(
        id: 1,
        foodId: foodId,
        description: 'Филе лосося или сёмги',
        measurement: '680 г'));
    ingredients.add(FoodIngredient(
        id: 1, foodId: foodId, description: 'Кунжут', measurement: 'по вкусу'));
    return ingredients;
  }
}