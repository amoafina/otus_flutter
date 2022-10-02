// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_step_link.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeStepLinkAdapter extends TypeAdapter<RecipeStepLink> {
  @override
  final int typeId = 7;

  @override
  RecipeStepLink read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeStepLink(
      id: fields[0] as int,
      number: fields[1] as int,
      recipe: fields[2] as EntityLink,
      step: fields[3] as EntityLink,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeStepLink obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.recipe)
      ..writeByte(3)
      ..write(obj.step);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeStepLinkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
