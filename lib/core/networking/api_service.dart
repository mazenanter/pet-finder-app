import 'package:dio/dio.dart';
import 'package:pet_finder_app/core/models/breed_model_reponse.dart';
import 'package:pet_finder_app/core/networking/api_constants.dart';
import 'package:pet_finder_app/features/favourite/data/models/breed_details_model.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_model.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/favourite/data/models/favorite_request_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.breeds)
  Future<List<BreedModelResponse>> getBreeds();

  @POST(ApiConstants.favroite)
  Future<FavoriteResponse> addToFav(
    @Body() FavoriteRequestBody favoriteRequestBody,
  );

  @GET(ApiConstants.favroite)
  Future<List<FavoriteModel>> getFavorites();

  @GET('${ApiConstants.images}/{image_id}')
  Future<BreedDetailsModel> getImages(@Path("image_id") String imageId);
}
