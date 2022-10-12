import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/hive/hive_types.dart';
import 'package:otusfood/model/entity_link.dart';

part 'recipe_step_link.g.dart';

@HiveType(typeId: HiveTypeId.recipeStepLink)
@JsonSerializable()
class RecipeStepLink {
  RecipeStepLink({
    required this.id,
    required this.number,
    required this.recipe,
    required this.step,
  });

  @HiveField(0)
  @JsonKey(name: 'id')
  int id;

  @HiveField(1)
  @JsonKey(name: 'number')
  int number;

  @HiveField(2)
  @JsonKey(name: 'recipe')
  EntityLink recipe;

  @HiveField(3)
  @JsonKey(name: 'step')
  EntityLink step;

  factory RecipeStepLink.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepLinkFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeStepLinkToJson(this);
}
