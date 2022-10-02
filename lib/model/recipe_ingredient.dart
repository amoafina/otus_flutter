import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/model/entity_link.dart';

part 'recipe_ingredient.g.dart';

@JsonSerializable()
class RecipeIngredient {
  RecipeIngredient(
      {required this.id,
      required this.count,
      required this.ingredient,
      required this.recipe});

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'ingredient')
  EntityLink ingredient;

  @JsonKey(name: 'recipe')
  EntityLink recipe;

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeIngredientToJson(this);
}
