import 'package:json_annotation/json_annotation.dart';
import 'package:pet_finder_app/features/favourite/data/models/breed_details_model.dart';
import 'package:pet_finder_app/features/favourite/data/models/image_data_model.dart';

part 'favorite_model.g.dart';

@JsonSerializable()
class FavoriteModel {
  final int id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'image_id')
  final String imageId;
  @JsonKey(name: 'sub_id')
  final String? subId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final ImageDataModel image;
  BreedDetailsModel? breedDetailsModel;
  FavoriteModel({
    required this.id,
    required this.userId,
    required this.imageId,
    required this.subId,
    required this.createdAt,
    required this.image,
    this.breedDetailsModel,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);
}
