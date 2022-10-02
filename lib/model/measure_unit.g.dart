// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measure_unit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeasureUnitAdapter extends TypeAdapter<MeasureUnit> {
  @override
  final int typeId = 5;

  @override
  MeasureUnit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeasureUnit(
      id: fields[0] as int,
      one: fields[1] as String,
      few: fields[2] as String,
      many: fields[3] as String,
      ingredients: (fields[4] as List).cast<Ingredient>(),
    );
  }

  @override
  void write(BinaryWriter writer, MeasureUnit obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.one)
      ..writeByte(2)
      ..write(obj.few)
      ..writeByte(3)
      ..write(obj.many)
      ..writeByte(4)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeasureUnitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeasureUnit _$MeasureUnitFromJson(Map<String, dynamic> json) => MeasureUnit(
      id: json['id'] as int,
      one: json['one'] as String,
      few: json['few'] as String,
      many: json['many'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MeasureUnitToJson(MeasureUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'one': instance.one,
      'few': instance.few,
      'many': instance.many,
      'ingredients': instance.ingredients,
    };
