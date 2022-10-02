import 'package:json_annotation/json_annotation.dart';

part 'entity_link.g.dart';

@JsonSerializable()
class EntityLink {
  EntityLink({required this.id});

  @JsonKey(name: 'id')
  int id;

  factory EntityLink.fromJson(Map<String, dynamic> json) =>
      _$EntityLinkFromJson(json);

  Map<String, dynamic> toJson() => _$EntityLinkToJson(this);
}
