import 'package:json_annotation/json_annotation.dart';
import 'package:models/cat/cat_breed.dart';

part 'cat_info.g.dart';

@JsonSerializable()
class CatInfo {
  String? id;
  String? url;
  int? width;
  int? height;
  List<CatBreed>? breeds;

  CatInfo({this.id, this.url, this.height, this.width, this.breeds});

  factory CatInfo.fromJson(Map<String, dynamic> json) =>
      _$CatInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CatInfoToJson(this);
}
