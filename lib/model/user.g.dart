// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      login: json['login'] as String,
      password: json['password'] as String,
      token: json['token'] as String,
      userFreezer: (json['userFreezer'] as List<dynamic>)
          .map((e) => Freezer.fromJson(e as Map<String, dynamic>))
          .toList(),
      favoriteRecipes: (json['favoriteRecipes'] as List<dynamic>)
          .map((e) => Favorite.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'password': instance.password,
      'token': instance.token,
      'userFreezer': instance.userFreezer,
      'favoriteRecipes': instance.favoriteRecipes,
      'comments': instance.comments,
    };
