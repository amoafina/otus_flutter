// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezer.dart';

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
