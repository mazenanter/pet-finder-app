import 'package:pet_finder_app/features/favourite/data/models/favorite_request_body.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_response.dart';
import 'package:pet_finder_app/features/favourite/domain/repo/favorite_repo.dart';

import '../../../../core/networking/api_result.dart';

class AddFavoriteUseCase {
  final FavoriteRepo favoriteRepo;
  AddFavoriteUseCase(this.favoriteRepo);
  Future<ApiResult<FavoriteResponse>> call({
    required FavoriteRequestBody favoriteRequestBody,
  }) {
    return favoriteRepo.addBreedToFavorite(favoriteRequestBody);
  }
}
