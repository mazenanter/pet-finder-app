import 'package:json_annotation/json_annotation.dart';

part 'image_data_model.g.dart';

@JsonSerializable()
class ImageDataModel {
  final String id;
  final String url;

  ImageDataModel({required this.id, required this.url});

  factory ImageDataModel.fromJson(Map<String, dynamic> json) =>
      _$ImageDataModelFromJson(json);
}
