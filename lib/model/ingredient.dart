import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/model/entity_link.dart';
import 'package:otusfood/model/freezer.dart';
import 'package:otusfood/model/recipe_ingredient.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  Ingredient(
      {required this.id,
      required this.name,
      required this.measureUnit,
      required this.recipeIngredients,
      required this.ingredientFreezer});

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'measureUnit')
  EntityLink measureUnit;

  @JsonKey(name: 'recipeIngredients')
  List<RecipeIngredient> recipeIngredients;

  @JsonKey(name: 'ingredientFreezer')
  List<Freezer> ingredientFreezer;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
