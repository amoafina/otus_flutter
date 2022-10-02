import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/model/comment.dart';
import 'package:otusfood/model/favorite.dart';
import 'package:otusfood/model/freezer.dart';

part 'user.g.dart';

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

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'login')
  String login;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'userFreezer')
  List<Freezer> userFreezer;

  @JsonKey(name: 'favoriteRecipes')
  List<Favorite> favoriteRecipes;

  @JsonKey(name: 'comments')
  List<Comment> comments;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
