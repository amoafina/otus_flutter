// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      id: json['id'] as int,
      name: json['name'] as String,
      duration: json['duration'] as int,
      photo: json['photo'] as String,
      recipeIngredients: (json['recipeIngredients'] as List<dynamic>)
          .map((e) => RecipeIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      recipeStepLinks: (json['recipeStepLinks'] as List<dynamic>)
          .map((e) => RecipeStepLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      favoriteRecipes: (json['favoriteRecipes'] as List<dynamic>)
          .map((e) => Favorite.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'photo': instance.photo,
      'recipeIngredients': instance.recipeIngredients,
      'recipeStepLinks': instance.recipeStepLinks,
      'favoriteRecipes': instance.favoriteRecipes,
    };
