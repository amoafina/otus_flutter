// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as int,
      text: json['text'] as String,
      photo: json['photo'] as String,
      datetime: json['datetime'] as String,
      user: EntityLink.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'photo': instance.photo,
      'datetime': instance.datetime,
      'user': instance.user,
    };
