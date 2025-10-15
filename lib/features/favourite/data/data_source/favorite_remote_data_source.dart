import 'package:pet_finder_app/core/networking/api_service.dart';
import 'package:pet_finder_app/features/favourite/data/models/breed_details_model.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_model.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_request_body.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_response.dart';

class FavoriteRemoteDataSource {
  final ApiService apiService;

  FavoriteRemoteDataSource(this.apiService);

  Future<FavoriteResponse> addBreedToFavorite(
    FavoriteRequestBody favoriteRequestBody,
  ) async {
    final res = await apiService.addToFav(favoriteRequestBody);
    return res;
  }

  Future<List<FavoriteModel>> getFovorites() async {
    final res = await apiService.getFavorites();
    return res;
  }

  Future<BreedDetailsModel> getBreedDetailsByImageId(String imageId) async {
    final response = await apiService.getImages(imageId);
    return response;
  }

  Future<String> deleteFavorite(int favoriteId) async {
    final res = await apiService.deleteFavorite(favoriteId);
    return res;
  }
}
