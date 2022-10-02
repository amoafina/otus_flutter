// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      id: json['id'] as int,
      name: json['name'] as String,
      measureUnit:
          EntityLink.fromJson(json['measureUnit'] as Map<String, dynamic>),
      recipeIngredients: (json['recipeIngredients'] as List<dynamic>)
          .map((e) => RecipeIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredientFreezer: (json['ingredientFreezer'] as List<dynamic>)
          .map((e) => Freezer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'measureUnit': instance.measureUnit,
      'recipeIngredients': instance.recipeIngredients,
      'ingredientFreezer': instance.ingredientFreezer,
    };
