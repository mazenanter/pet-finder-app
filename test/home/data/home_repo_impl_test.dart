import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/core/models/breed_model_reponse.dart';
import 'package:pet_finder_app/core/models/weight_model.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:pet_finder_app/features/home/data/repo/home_repo_impl.dart';

class MockHomeRemoteDataSource extends Mock implements HomeRemoteDataSource {}

void main() {
  late MockHomeRemoteDataSource mockRemoteDataSource;
  late HomeRepoImpl homeRepo;

  setUp(() {
    mockRemoteDataSource = MockHomeRemoteDataSource();
    homeRepo = HomeRepoImpl(mockRemoteDataSource);
  });

  group('HomeRepoImpl - getBreeds', () {
    test('should return Success when datasource returns data', () async {
      // arrange
      final mockResponse = [
        BreedModelResponse(
          name: 'Abyssinian',
          referenceImageId: 'img_1',
          weight: WeightModel(imperial: '1-2', metric: '1-2'),
          id: '1',
          temperament: '',
          origin: '',
          countryCodes: '',
          countryCode: '',
          description: '',
          lifeSpan: '',
          indoor: 2,
          altNames: '',
          adaptability: 13,
          affectionLevel: 10,
          childFriendly: 13,
          dogFriendly: 13,
          energyLevel: 13,
          grooming: 13,
          healthIssues: 13,
          intelligence: 13,
          sheddingLevel: 13,
          socialNeeds: 13,
          strangerFriendly: 13,
          vocalisation: 13,
          experimental: 13,
          hairless: 13,
          natural: 13,
          rare: 13,
          rex: 13,
          suppressedTail: 13,
          shortLegs: 13,
          hypoallergenic: 13,
        ),
      ];
      when(
        () => mockRemoteDataSource.getBreeds(),
      ).thenAnswer((_) async => mockResponse);

      // act
      final result = await homeRepo.getBreeds();

      // assert
      expect(result, isA<Success>());
      final success = result as Success;
      expect(success.data.first.name, 'Abyssinian');
      verify(() => mockRemoteDataSource.getBreeds()).called(1);
    });

    test('should return Failure when datasource throws exception', () async {
      // arrange
      when(
        () => mockRemoteDataSource.getBreeds(),
      ).thenThrow(Exception('network error'));

      // act
      final result = await homeRepo.getBreeds();

      // assert
      expect(result, isA<Failure>());
      verify(() => mockRemoteDataSource.getBreeds()).called(1);
    });
  });
}
