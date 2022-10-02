// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 9;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe(
      id: fields[0] as int,
      name: fields[1] as String,
      duration: fields[2] as int,
      photo: fields[3] as String,
      recipeIngredients: (fields[4] as List).cast<RecipeIngredient>(),
      recipeStepLinks: (fields[5] as List).cast<RecipeStepLink>(),
      favoriteRecipes: (fields[6] as List).cast<Favorite>(),
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.photo)
      ..writeByte(4)
      ..write(obj.recipeIngredients)
      ..writeByte(5)
      ..write(obj.recipeStepLinks)
      ..writeByte(6)
      ..write(obj.favoriteRecipes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
