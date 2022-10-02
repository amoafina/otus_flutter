import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/model/entity_link.dart';

part 'recipe_step_link.g.dart';

@JsonSerializable()
class RecipeStepLink {
  RecipeStepLink(
      {required this.id,
      required this.number,
      required this.recipe,
      required this.step});

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'number')
  int number;

  @JsonKey(name: 'recipe')
  EntityLink recipe;

  @JsonKey(name: 'step')
  EntityLink step;

  factory RecipeStepLink.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepLinkFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeStepLinkToJson(this);
}
