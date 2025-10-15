import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/favourite/data/data_source/favorite_remote_data_source.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_model.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_request_body.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_response.dart';
import 'package:pet_finder_app/features/favourite/domain/repo/favorite_repo.dart';

import '../../../../core/networking/api_error_handler.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteRepoImpl(this.favoriteRemoteDataSource);
  @override
  Future<ApiResult<FavoriteResponse>> addBreedToFavorite(
    FavoriteRequestBody favoriteRequestBody,
  ) async {
    try {
      final res = await favoriteRemoteDataSource.addBreedToFavorite(
        favoriteRequestBody,
      );

      return Success(res);
    } catch (error) {
      return Failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<FavoriteModel>>> getFavorites() async {
    try {
      final favorites = await favoriteRemoteDataSource.getFovorites();

      for (var fav in favorites) {
        final details = await favoriteRemoteDataSource.getBreedDetailsByImageId(
          fav.imageId,
        );
        fav.breedDetailsModel = details;
      }

      return Success(favorites);
    } catch (error) {
      return Failure(ApiErrorHandler.handle(error));
    }
  }
}
