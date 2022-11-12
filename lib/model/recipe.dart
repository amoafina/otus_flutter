import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/hive/hive_types.dart';
import 'package:otusfood/model/base_module.dart';

part 'recipe.g.dart';

@HiveType(typeId: HiveTypeId.recipe)
@JsonSerializable()
class Recipe extends BaseModel {
  Recipe({
    required this.id,
    required this.name,
    required this.duration,
    required this.photo,
    // required this.recipeIngredients,
    // required this.recipeStepLinks,
    // required this.favoriteRecipes,
  });

  @HiveField(0)
  @JsonKey(name: 'id')
  int id;

  @HiveField(1)
  @JsonKey(name: 'name')
  String name;

  @HiveField(2)
  @JsonKey(name: 'duration')
  int duration;

  @HiveField(3)
  @JsonKey(name: 'photo')
  String photo;

  // @HiveField(4)
  // @JsonKey(name: 'recipeIngredients')
  // List<RecipeIngredient> recipeIngredients;
  //
  // @HiveField(5)
  // @JsonKey(name: 'recipeStepLinks')
  // List<RecipeStepLink> recipeStepLinks;
  //
  // @HiveField(6)
  // @JsonKey(name: 'favoriteRecipes')
  // List<Favorite> favoriteRecipes;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);

  String getTimeValue() {
    if (duration >= 60) {
      int hours = Duration(minutes: duration).inHours;
      int minutes = duration - Duration(hours: hours).inMinutes;
      if (hours < 21) {
        String str = "$hours ${_formatHours(hours)}";
        if (minutes > 0) {
          str += " $minutes ${_formatMinutes(minutes)}";
        }
        return str;
      } else {
        return "Более 20 часов";
      }
    }
    return "$duration ${_formatMinutes(duration)}";
  }

  String getLocalPath() => "assets/images/$photo";

  String getNetworkPath() => photo;

  String _formatHours(int hours) {
    if (hours == 1) {
      return "час";
    } else if (hours > 1 && hours < 5) {
      return "часа";
    } else {
      return "часов";
    }
  }

  String _formatMinutes(int minutes) {
    int remainder = minutes % 10;
    if (remainder == 1) {
      return "минута";
    } else if (remainder > 1 && remainder < 5) {
      return "минуты";
    } else {
      return "минут";
    }
  }

  @override
  List<Recipe> parseBox<Recipe>(Box<Recipe> box) {
    return box.values.toList();
  }

  @override
  int? getItemId() {
    return id;
  }
}
