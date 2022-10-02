import 'package:json_annotation/json_annotation.dart';
import 'package:otusfood/model/ingredient.dart';

part 'measure_unit.g.dart';

@JsonSerializable()
class MeasureUnit {
  MeasureUnit(
      {required this.id,
      required this.one,
      required this.few,
      required this.many,
      required this.ingredients});

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'one')
  String one;

  @JsonKey(name: 'few')
  String few;

  @JsonKey(name: 'many')
  String many;

  @JsonKey(name: 'ingredients')
  List<Ingredient> ingredients;

  factory MeasureUnit.fromJson(Map<String, dynamic> json) =>
      _$MeasureUnitFromJson(json);

  Map<String, dynamic> toJson() => _$MeasureUnitToJson(this);
}
