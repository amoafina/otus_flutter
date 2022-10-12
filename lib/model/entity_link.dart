import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../hive/hive_types.dart';

part 'entity_link.g.dart';

@HiveType(typeId: HiveTypeId.entityLink)
@JsonSerializable()
class EntityLink {
  EntityLink({required this.id});

  @HiveField(0)
  @JsonKey(name: 'id')
  int id;

  factory EntityLink.fromJson(Map<String, dynamic> json) =>
      _$EntityLinkFromJson(json);

  Map<String, dynamic> toJson() => _$EntityLinkToJson(this);
}
