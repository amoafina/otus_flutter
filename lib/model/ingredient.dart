import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/hive/hive_types.dart';
import 'package:otusfood/model/base_module.dart';
import 'package:otusfood/model/entity_link.dart';
import 'package:otusfood/model/freezer.dart';
import 'package:otusfood/model/recipe_ingredient.dart';

part 'ingredient.g.dart';

@HiveType(typeId: HiveTypeId.ingredient)
@JsonSerializable()
class Ingredient extends BaseModel<Ingredient> {
  Ingredient(
      {required this.id,
      required this.name,
      required this.measureUnit,
      required this.recipeIngredients,
      required this.ingredientFreezer});

  @HiveField(0)
  @JsonKey(name: 'id')
  int id;

  @HiveField(1)
  @JsonKey(name: 'name')
  String name;

  @HiveField(2)
  @JsonKey(name: 'measureUnit')
  EntityLink measureUnit;

  @HiveField(3)
  @JsonKey(name: 'recipeIngredients')
  List<RecipeIngredient> recipeIngredients;

  @HiveField(4)
  @JsonKey(name: 'ingredientFreezer')
  List<Freezer> ingredientFreezer;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);

  @override
  List<Ingredient> parseBox<Ingredient>(Box<Ingredient> box) {
    return [];
  }
}
