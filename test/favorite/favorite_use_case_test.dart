import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_model.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_request_body.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_response.dart';
import 'package:pet_finder_app/features/favourite/data/models/image_data_model.dart';
import 'package:pet_finder_app/features/favourite/domain/repo/favorite_repo.dart';
import 'package:pet_finder_app/features/favourite/domain/use_cases/add_favorite_use_case.dart';
import 'package:pet_finder_app/features/favourite/domain/use_cases/delete_favorite_use_case.dart';
import 'package:pet_finder_app/features/favourite/domain/use_cases/get_favorite_use_case.dart';

class MockFavoriteRepo extends Mock implements FavoriteRepo {}

void main() {
  late MockFavoriteRepo mockRepo;
  late AddFavoriteUseCase addFavoriteUseCase;
  late GetFavoriteUseCase getFavoriteUseCase;
  late DeleteFavoriteUseCase deleteFavoriteUseCase;

  setUp(() {
    mockRepo = MockFavoriteRepo();
    addFavoriteUseCase = AddFavoriteUseCase(mockRepo);
    getFavoriteUseCase = GetFavoriteUseCase(mockRepo);
    deleteFavoriteUseCase = DeleteFavoriteUseCase(mockRepo);
  });

  final tBody = FavoriteRequestBody(imageId: "123", subId: '123');
  final tResponse = FavoriteResponse(id: 1, message: "Added");
  final tList = [
    FavoriteModel(
      id: 1,
      imageId: "123",
      userId: '',
      subId: '',
      createdAt: '',
      image: ImageDataModel(id: '123', url: 'url'),
    ),
  ];

  test('AddFavoriteUseCase calls repo and returns Success', () async {
    when(
      () => mockRepo.addBreedToFavorite(tBody),
    ).thenAnswer((_) async => Success(tResponse));

    final result = await addFavoriteUseCase.call(favoriteRequestBody: tBody);

    expect(result, isA<Success>());
    verify(() => mockRepo.addBreedToFavorite(tBody)).called(1);
  });

  test('GetFavoriteUseCase calls repo and returns Success', () async {
    when(() => mockRepo.getFavorites()).thenAnswer((_) async => Success(tList));

    final result = await getFavoriteUseCase.call();

    expect(result, isA<Success>());
    verify(() => mockRepo.getFavorites()).called(1);
  });

  test('DeleteFavoriteUseCase calls repo and returns Success', () async {
    when(
      () => mockRepo.deleteFavorite(1),
    ).thenAnswer((_) async => Success("Deleted"));

    final result = await deleteFavoriteUseCase.call(1);

    expect(result, isA<Success>());
    verify(() => mockRepo.deleteFavorite(1)).called(1);
  });
}
