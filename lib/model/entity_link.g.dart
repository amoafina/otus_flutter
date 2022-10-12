// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_link.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntityLinkAdapter extends TypeAdapter<EntityLink> {
  @override
  final int typeId = 11;

  @override
  EntityLink read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EntityLink(
      id: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, EntityLink obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityLinkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntityLink _$EntityLinkFromJson(Map<String, dynamic> json) => EntityLink(
      id: json['id'] as int,
    );

Map<String, dynamic> _$EntityLinkToJson(EntityLink instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
