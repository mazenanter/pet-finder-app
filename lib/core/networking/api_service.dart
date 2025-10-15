import 'package:dio/dio.dart';
import 'package:pet_finder_app/core/models/breed_model_reponse.dart';
import 'package:pet_finder_app/core/networking/api_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.breeds)
  Future<List<BreedModelResponse>> getBreeds();
}
