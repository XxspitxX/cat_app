import 'package:json_annotation/json_annotation.dart';

part 'cat_weight.g.dart';

@JsonSerializable()
class CatWeight {
  String? imperial;
  String? metric;

  CatWeight({
    this.imperial,
    this.metric,
  });

  factory CatWeight.fromJson(Map<String, dynamic> json) =>
      _$CatWeightFromJson(json);

  Map<String, dynamic> toJson() => _$CatWeightToJson(this);
}
