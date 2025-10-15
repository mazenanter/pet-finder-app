import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_model.dart';
import 'package:pet_finder_app/features/favourite/domain/repo/favorite_repo.dart';

class GetFavoriteUseCase {
  final FavoriteRepo favoriteRepo;
  GetFavoriteUseCase(this.favoriteRepo);

  Future<ApiResult<List<FavoriteModel>>> call() => favoriteRepo.getFavorites();
}
