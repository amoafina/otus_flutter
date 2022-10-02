import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/model/entity_link.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  Comment({
    required this.id,
    required this.text,
    required this.photo,
    required this.datetime,
    required this.user,
  });

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'text')
  String text;

  @JsonKey(name: 'photo')
  String photo;

  @JsonKey(name: 'datetime')
  String datetime;

  @JsonKey(name: 'user')
  EntityLink user;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
