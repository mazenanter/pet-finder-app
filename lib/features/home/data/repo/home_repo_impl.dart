import 'package:pet_finder_app/core/models/breed_model_reponse.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:pet_finder_app/features/home/domain/entities/breed_entity.dart';
import 'package:pet_finder_app/features/home/domain/repo/home_repo.dart';

import '../../../../core/networking/api_error_handler.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepoImpl(this._remoteDataSource);
  @override
  Future<ApiResult<List<BreedEntity>>> getBreeds() async {
    try {
      final List<BreedModelResponse> res = await _remoteDataSource.getBreeds();
      final list = res
          .map(
            (e) => BreedEntity(
              name: e.name ?? 'unkown',
              imageUrl: e.referenceImageId ?? '',
              description: e.description ?? 'unknown',
              temperament: e.temperament ?? 'unknown',
              origin: e.origin ?? 'unknown',
              countryCode: e.countryCode ?? 'unknown',
              age: e.lifeSpan ?? 'unknown',
            ),
          )
          .toList();
      return Success(list);
    } catch (error) {
      return Failure(ApiErrorHandler.handle(error));
    }
  }
}
