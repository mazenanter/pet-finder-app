import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_model.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_request_body.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_response.dart';

abstract class FavoriteRepo {
  Future<ApiResult<FavoriteResponse>> addBreedToFavorite(
    FavoriteRequestBody favoriteRequestBody,
  );

  Future<ApiResult<List<FavoriteModel>>> getFavorites();
}
