// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_step_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeStepLink _$RecipeStepLinkFromJson(Map<String, dynamic> json) =>
    RecipeStepLink(
      id: json['id'] as int,
      number: json['number'] as int,
      recipe: EntityLink.fromJson(json['recipe'] as Map<String, dynamic>),
      step: EntityLink.fromJson(json['step'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipeStepLinkToJson(RecipeStepLink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'recipe': instance.recipe,
      'step': instance.step,
    };
