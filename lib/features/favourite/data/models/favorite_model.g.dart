// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) =>
    FavoriteModel(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String,
      imageId: json['image_id'] as String,
      subId: json['sub_id'] as String?,
      createdAt: json['created_at'] as String,
      image: ImageDataModel.fromJson(json['image'] as Map<String, dynamic>),
      breedDetailsModel: json['breedDetailsModel'] == null
          ? null
          : BreedDetailsModel.fromJson(
              json['breedDetailsModel'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$FavoriteModelToJson(FavoriteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'image_id': instance.imageId,
      'sub_id': instance.subId,
      'created_at': instance.createdAt,
      'image': instance.image,
      'breedDetailsModel': instance.breedDetailsModel,
    };
