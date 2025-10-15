import 'package:pet_finder_app/features/home/domain/entities/breed_entity.dart';
import 'package:pet_finder_app/features/home/domain/repo/home_repo.dart';

import '../../../../core/networking/api_result.dart';

class GetBreedUseCase {
  final HomeRepo repo;
  GetBreedUseCase(this.repo);

  Future<ApiResult<List<BreedEntity>>> call() {
    return repo.getBreeds();
  }
}
