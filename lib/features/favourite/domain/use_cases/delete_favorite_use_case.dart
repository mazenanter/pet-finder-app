import 'package:pet_finder_app/features/favourite/domain/repo/favorite_repo.dart';

import '../../../../core/networking/api_result.dart';

class DeleteFavoriteUseCase {
  final FavoriteRepo favoriteRepo;
  DeleteFavoriteUseCase(this.favoriteRepo);
  Future<ApiResult<String>> call(int favoriteId) =>
      favoriteRepo.deleteFavorite(favoriteId);
}
