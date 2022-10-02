import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/model/entity_link.dart';

part 'freezer.g.dart';

@JsonSerializable()
class Freezer {
  Freezer(
      {required this.id,
      required this.count,
      required this.user,
      required this.ingredient});

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'user')
  EntityLink user;

  @JsonKey(name: 'ingredient')
  EntityLink ingredient;

  factory Freezer.fromJson(Map<String, dynamic> json) =>
      _$FreezerFromJson(json);

  Map<String, dynamic> toJson() => _$FreezerToJson(this);
}
