// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Favorite _$FavoriteFromJson(Map<String, dynamic> json) => Favorite(
      id: json['id'] as int,
      recipe: EntityLink.fromJson(json['recipe'] as Map<String, dynamic>),
      user: EntityLink.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteToJson(Favorite instance) => <String, dynamic>{
      'id': instance.id,
      'recipe': instance.recipe,
      'user': instance.user,
    };
