import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/hive/hive_types.dart';
import 'package:otusfood/model/ingredient.dart';

part 'measure_unit.g.dart';

@HiveType(typeId: HiveTypeId.measureUnit)
@JsonSerializable()
class MeasureUnit {
  MeasureUnit(
      {required this.id,
      required this.one,
      required this.few,
      required this.many,
      required this.ingredients});

  @HiveField(0)
  @JsonKey(name: 'id')
  int id;

  @HiveField(1)
  @JsonKey(name: 'one')
  String one;

  @HiveField(2)
  @JsonKey(name: 'few')
  String few;

  @HiveField(3)
  @JsonKey(name: 'many')
  String many;

  @HiveField(4)
  @JsonKey(name: 'ingredients')
  List<Ingredient> ingredients;

  factory MeasureUnit.fromJson(Map<String, dynamic> json) =>
      _$MeasureUnitFromJson(json);

  Map<String, dynamic> toJson() => _$MeasureUnitToJson(this);
}
