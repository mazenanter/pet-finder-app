// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedDetailsModel _$BreedDetailsModelFromJson(Map<String, dynamic> json) =>
    BreedDetailsModel(
      id: json['id'] as String,
      url: json['url'] as String,
      breeds: (json['breeds'] as List<dynamic>)
          .map((e) => BreedInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
    );

Map<String, dynamic> _$BreedDetailsModelToJson(BreedDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'breeds': instance.breeds,
      'width': instance.width,
      'height': instance.height,
    };
