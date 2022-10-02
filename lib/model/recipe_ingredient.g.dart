// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeIngredient _$RecipeIngredientFromJson(Map<String, dynamic> json) =>
    RecipeIngredient(
      id: json['id'] as int,
      count: json['count'] as int,
      ingredient:
          EntityLink.fromJson(json['ingredient'] as Map<String, dynamic>),
      recipe: EntityLink.fromJson(json['recipe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipeIngredientToJson(RecipeIngredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'ingredient': instance.ingredient,
      'recipe': instance.recipe,
    };
