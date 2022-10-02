import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/hive/hive_types.dart';
import 'package:otusfood/model/entity_link.dart';

part 'comment.g.dart';

@HiveType(typeId: HiveTypeId.comment)
@JsonSerializable()
class Comment {
  Comment({
    required this.id,
    required this.text,
    required this.photo,
    required this.datetime,
    required this.user,
  });

  @HiveField(0)
  @JsonKey(name: 'id')
  int id;

  @HiveField(1)
  @JsonKey(name: 'text')
  String text;

  @HiveField(2)
  @JsonKey(name: 'photo')
  String photo;

  @HiveField(3)
  @JsonKey(name: 'datetime')
  String datetime;

  @HiveField(4)
  @JsonKey(name: 'user')
  EntityLink user;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
