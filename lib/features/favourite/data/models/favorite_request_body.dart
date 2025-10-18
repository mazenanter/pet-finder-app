import 'package:json_annotation/json_annotation.dart';

part 'favorite_request_body.g.dart';

@JsonSerializable()
class FavoriteRequestBody {
  @JsonKey(name: 'image_id')
  final String imageId;

  @JsonKey(name: 'sub_id')
  final String subId;

  FavoriteRequestBody({required this.imageId, required this.subId});

  Map<String, dynamic> toJson() => _$FavoriteRequestBodyToJson(this);
}
