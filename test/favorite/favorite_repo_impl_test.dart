import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/favourite/data/data_source/favorite_remote_data_source.dart';
import 'package:pet_finder_app/features/favourite/data/models/breed_details_model.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_model.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_request_body.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_response.dart';
import 'package:pet_finder_app/features/favourite/data/models/image_data_model.dart';
import 'package:pet_finder_app/features/favourite/data/repo/favorite_repo_impl.dart';

class MockFavoriteRemoteDataSource extends Mock implements FavoriteRemoteDataSource {}
class FakeFavoriteRequestBody extends Fake implements FavoriteRequestBody {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeFavoriteRequestBody());
  });

  late MockFavoriteRemoteDataSource mockDataSource;
  late FavoriteRepoImpl repo;

  setUp(() {
    mockDataSource = MockFavoriteRemoteDataSource();
    repo = FavoriteRepoImpl(mockDataSource);
  });

  final tFavoriteResponse = FavoriteResponse(id: 1, message: "Added");
  final tFavoriteRequestBody = FavoriteRequestBody(imageId: "abc123", subId: '1323');
  final tFavoriteModel = FavoriteModel(id: 1, imageId: "abc123", userId: '123', subId: '123', createdAt: '123', image: ImageDataModel(id: '123', url: 'url'));
  final tBreedDetailsModel = BreedDetailsModel(
    id: '1',
    url: 'image_url',
    breeds: [], width: 125, height: 80,
  );

  group('FavoriteRepoImpl Tests', () {
    test('should return Success when addBreedToFavorite succeeds', () async {
      when(() => mockDataSource.addBreedToFavorite(any()))
          .thenAnswer((_) async => tFavoriteResponse);

      final result = await repo.addBreedToFavorite(tFavoriteRequestBody);

      expect(result, isA<Success>());
      verify(() => mockDataSource.addBreedToFavorite(tFavoriteRequestBody)).called(1);
    });

    test('should return Success when deleteFavorite succeeds', () async {
      when(() => mockDataSource.deleteFavorite(1)).thenAnswer((_) async => "Deleted");

      final result = await repo.deleteFavorite(1);

      expect(result, isA<Success>());
      verify(() => mockDataSource.deleteFavorite(1)).called(1);
    });

    test('should return Success when getFavorites succeeds', () async {
      when(() => mockDataSource.getFovorites())
          .thenAnswer((_) async => [tFavoriteModel]);
      when(() => mockDataSource.getBreedDetailsByImageId(any()))
          .thenAnswer((_) async => tBreedDetailsModel);

      final result = await repo.getFavorites();

      expect(result, isA<Success>());
      verify(() => mockDataSource.getFovorites()).called(1);
    });
  });
}
