import 'package:get_it/get_it.dart';
import 'package:pet_finder_app/core/networking/api_service.dart';
import 'package:pet_finder_app/core/networking/dio_factory.dart';
import 'package:pet_finder_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:pet_finder_app/features/home/data/repo/home_repo_impl.dart';
import 'package:pet_finder_app/features/home/domain/repo/home_repo.dart';
import 'package:pet_finder_app/features/home/domain/use_cases/get_breed_use_case.dart';
import 'package:pet_finder_app/features/home/presentation/controller/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio
  getIt.registerLazySingleton(() => DioFactory.getDio());

  // ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt()));

  // DataSource
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(getIt<ApiService>()),
  );

  // Repository
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(getIt<HomeRemoteDataSource>()),
  );

  // UseCases
  getIt.registerLazySingleton(() => GetBreedUseCase(getIt<HomeRepo>()));
  // Home Cubit
  getIt.registerFactory(() => HomeCubit(getIt<GetBreedUseCase>()));
}
