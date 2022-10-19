import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/hive/hive_types.dart';
import 'package:otusfood/model/base_module.dart';
import 'package:otusfood/model/entity_link.dart';

part 'favorite.g.dart';

@HiveType(typeId: HiveTypeId.favorite)
@JsonSerializable()
class Favorite extends BaseModel {
  Favorite({required this.id, required this.recipe, required this.user});

  @HiveField(0)
  @JsonKey(name: 'id')
  int id;

  @HiveField(1)
  @JsonKey(name: 'recipe')
  EntityLink recipe;

  @HiveField(2)
  @JsonKey(name: 'user')
  EntityLink user;

  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteToJson(this);
}
