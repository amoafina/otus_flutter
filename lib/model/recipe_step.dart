import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/model/recipe_step_link.dart';

part 'recipe_step.g.dart';

@JsonSerializable()
class RecipeStep {
  RecipeStep(
      {required this.id,
      required this.name,
      required this.duration,
      required this.recipeStepLinks});

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'duration')
  int duration;

  @JsonKey(name: 'recipeStepLinks')
  List<RecipeStepLink> recipeStepLinks;

  factory RecipeStep.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeStepToJson(this);
  
  getTimeMinute() {
    int minute = duration ~/ 60;
    int sec = duration % 60;
    String txtMinute = minute < 10 ? "0$minute" : minute.toString();
    String txtSec = sec < 10 ? "0$sec" : sec.toString();
    return "$txtMinute:$txtSec";
  }
}
