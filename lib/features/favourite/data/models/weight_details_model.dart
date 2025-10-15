import 'package:json_annotation/json_annotation.dart';

part 'weight_details_model.g.dart';

@JsonSerializable()
class WeightDetailsModel {
  final String imperial;
  final String metric;

  WeightDetailsModel({required this.imperial, required this.metric});

  factory WeightDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$WeightDetailsModelFromJson(json);
}
