// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_step.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeStepAdapter extends TypeAdapter<RecipeStep> {
  @override
  final int typeId = 8;

  @override
  RecipeStep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeStep(
      id: fields[0] as int,
      name: fields[1] as String,
      duration: fields[2] as int,
      recipeStepLinks: (fields[3] as List).cast<RecipeStepLink>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecipeStep obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.recipeStepLinks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeStepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
    )..isSuccess = json['isSuccess'] as bool;

Map<String, dynamic> _$RecipeStepToJson(RecipeStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'recipeStepLinks': instance.recipeStepLinks,
      'isSuccess': instance.isSuccess,
    };
