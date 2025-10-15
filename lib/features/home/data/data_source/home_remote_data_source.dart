import 'package:pet_finder_app/core/networking/api_service.dart';

import '../../../../core/models/breed_model_reponse.dart';

class HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSource(this.apiService);

  Future<List<BreedModelResponse>> getBreeds() async {
    final response = await apiService.getBreeds();
    return response;
  }
}
