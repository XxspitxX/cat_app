// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatInfo _$CatInfoFromJson(Map<String, dynamic> json) => CatInfo(
      id: json['id'] as String?,
      url: json['url'] as String?,
      height: (json['height'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      breeds: (json['breeds'] as List<dynamic>?)
          ?.map((e) => CatBreed.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CatInfoToJson(CatInfo instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'breeds': instance.breeds,
    };
