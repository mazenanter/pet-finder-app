import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/home/domain/entities/breed_entity.dart';
import 'package:pet_finder_app/features/home/domain/repo/home_repo.dart';
import 'package:pet_finder_app/features/home/domain/use_cases/get_breed_use_case.dart';

class MockHomeRepo extends Mock implements HomeRepo {}

void main() {
  late MockHomeRepo mockHomeRepo;
  late GetBreedUseCase useCase;

  setUp(() {
    mockHomeRepo = MockHomeRepo();
    useCase = GetBreedUseCase(mockHomeRepo);
  });

  test('should call HomeRepo.getBreeds and return ApiResult', () async {
    // arrange
    final breeds = [
      BreedEntity(
        name: 'Abyssinian',
        imageUrl: 'img_1',
        description: 'Short-haired breed',
        temperament: 'Active',
        origin: 'Egypt',
        countryCode: 'EG',
        age: '12 years',
      ),
    ];
    when(
      () => mockHomeRepo.getBreeds(),
    ).thenAnswer((_) async => Success(breeds));

    // act
    final result = await useCase.call();

    // assert
    expect(result, isA<Success>());
    verify(() => mockHomeRepo.getBreeds()).called(1);
  });
}
