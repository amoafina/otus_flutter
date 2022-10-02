import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/hive/hive_types.dart';
import 'package:otusfood/model/entity_link.dart';

part 'recipe_ingredient.g.dart';

@HiveType(typeId: HiveTypeId.recipeIngredient)
@JsonSerializable()
class RecipeIngredient {
  RecipeIngredient(
      {required this.id,
      required this.count,
      required this.ingredient,
      required this.recipe});

  @HiveField(0)
  @JsonKey(name: 'id')
  int id;

  @HiveField(1)
  @JsonKey(name: 'count')
  int count;

  @HiveField(2)
  @JsonKey(name: 'ingredient')
  EntityLink ingredient;

  @HiveField(3)
  @JsonKey(name: 'recipe')
  EntityLink recipe;

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeIngredientToJson(this);
}
