import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/hive/hive_types.dart';
import 'package:otusfood/model/entity_link.dart';

part 'freezer.g.dart';

@HiveType(typeId: HiveTypeId.freezer)
@JsonSerializable()
class Freezer {
  Freezer(
      {required this.id,
      required this.count,
      required this.user,
      required this.ingredient});

  @HiveField(0)
  @JsonKey(name: 'id')
  int id;

  @HiveField(1)
  @JsonKey(name: 'count')
  int count;

  @HiveField(2)
  @JsonKey(name: 'user')
  EntityLink user;

  @HiveField(3)
  @JsonKey(name: 'ingredient')
  EntityLink ingredient;

  factory Freezer.fromJson(Map<String, dynamic> json) =>
      _$FreezerFromJson(json);

  Map<String, dynamic> toJson() => _$FreezerToJson(this);
}
