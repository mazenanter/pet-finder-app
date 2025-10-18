import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/home/domain/entities/breed_entity.dart';
import 'package:pet_finder_app/features/home/domain/use_cases/get_breed_use_case.dart';
import 'package:pet_finder_app/features/home/presentation/controller/home_cubit.dart';
import 'package:pet_finder_app/features/home/presentation/controller/home_states.dart';

class MockGetBreedUseCase extends Mock implements GetBreedUseCase {}

void main() {
  late MockGetBreedUseCase mockGetBreedUseCase;
  late HomeCubit homeCubit;

  setUp(() {
    mockGetBreedUseCase = MockGetBreedUseCase();
    homeCubit = HomeCubit(mockGetBreedUseCase);
  });

  tearDown(() {
    homeCubit.close();
  });

  final mockList = [
    BreedEntity(
      name: 'Abyssinian',
      imageUrl: 'img_1',
      description: 'Active and smart',
      temperament: 'Playful',
      origin: 'Egypt',
      countryCode: 'EG',
      age: '10 years',
    ),
  ];

  blocTest<HomeCubit, HomeStates>(
    'emits [GetBreedsLoading, GetBreedsSuccess] when getBreeds succeeds',
    build: () {
      when(
        () => mockGetBreedUseCase.call(),
      ).thenAnswer((_) async => Success(mockList));
      return homeCubit;
    },
    act: (cubit) => cubit.getBreeds(),
    expect: () => [isA<GetBreedsLoading>(), isA<GetBreedsSuccess>()],
    verify: (_) {
      verify(() => mockGetBreedUseCase.call()).called(1);
    },
  );

  blocTest<HomeCubit, HomeStates>(
    'emits [GetBreedsLoading, GetBreedsError] when getBreeds fails',
    build: () {
      when(
        () => mockGetBreedUseCase.call(),
      ).thenAnswer((_) async => Failure('error'));
      return homeCubit;
    },
    act: (cubit) => cubit.getBreeds(),
    expect: () => [isA<GetBreedsLoading>(), isA<GetBreedsError>()],
  );
}
