import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/model/entity_link.dart';

part 'favorite.g.dart';

@JsonSerializable()
class Favorite {
  Favorite({required this.id, required this.recipe, required this.user});

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'recipe')
  EntityLink recipe;

  @JsonKey(name: 'user')
  EntityLink user;

  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteToJson(this);
}
