import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/home/domain/entities/breed_entity.dart';

abstract class HomeRepo {
  Future<ApiResult<List<BreedEntity>>> getBreeds();
}
