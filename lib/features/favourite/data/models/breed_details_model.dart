import 'package:json_annotation/json_annotation.dart';
import 'package:pet_finder_app/features/favourite/data/models/breed_info_model.dart';

part 'breed_details_model.g.dart';

@JsonSerializable()
class BreedDetailsModel {
  final String id;
  final String url;
  final List<BreedInfoModel> breeds;
  final int width;
  final int height;

  BreedDetailsModel({
    required this.id,
    required this.url,
    required this.breeds,
    required this.width,
    required this.height,
  });

  factory BreedDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BreedDetailsModelFromJson(json);
}
