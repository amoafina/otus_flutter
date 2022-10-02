// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeStep _$RecipeStepFromJson(Map<String, dynamic> json) => RecipeStep(
      id: json['id'] as int,
      name: json['name'] as String,
      duration: json['duration'] as int,
      recipeStepLinks: (json['recipeStepLinks'] as List<dynamic>)
          .map((e) => RecipeStepLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeStepToJson(RecipeStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'recipeStepLinks': instance.recipeStepLinks,
    };
