// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FreezerAdapter extends TypeAdapter<Freezer> {
  @override
  final int typeId = 3;

  @override
  Freezer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Freezer(
      id: fields[0] as int,
      count: fields[1] as int,
      user: fields[2] as EntityLink,
      ingredient: fields[3] as EntityLink,
    );
  }

  @override
  void write(BinaryWriter writer, Freezer obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.user)
      ..writeByte(3)
      ..write(obj.ingredient);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FreezerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Freezer _$FreezerFromJson(Map<String, dynamic> json) => Freezer(
      id: json['id'] as int,
      count: json['count'] as int,
      user: EntityLink.fromJson(json['user'] as Map<String, dynamic>),
      ingredient:
          EntityLink.fromJson(json['ingredient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FreezerToJson(Freezer instance) => <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'user': instance.user,
      'ingredient': instance.ingredient,
    };
