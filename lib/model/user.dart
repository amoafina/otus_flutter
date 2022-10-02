import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/hive/hive_types.dart';
import 'package:otusfood/model/comment.dart';
import 'package:otusfood/model/favorite.dart';
import 'package:otusfood/model/freezer.dart';

part 'user.g.dart';

@HiveType(typeId: HiveTypeId.user)
@JsonSerializable()
class User {
  User(
      {required this.id,
      required this.login,
      required this.password,
      required this.token,
      required this.userFreezer,
      required this.favoriteRecipes,
      required this.comments});

  @HiveField(0)
  @JsonKey(name: 'id')
  int id;

  @HiveField(1)
  @JsonKey(name: 'login')
  String login;

  @HiveField(2)
  @JsonKey(name: 'password')
  String password;

  @HiveField(3)
  @JsonKey(name: 'token')
  String token;

  @HiveField(4)
  @JsonKey(name: 'userFreezer')
  List<Freezer> userFreezer;

  @HiveField(5)
  @JsonKey(name: 'favoriteRecipes')
  List<Favorite> favoriteRecipes;

  @HiveField(6)
  @JsonKey(name: 'comments')
  List<Comment> comments;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
