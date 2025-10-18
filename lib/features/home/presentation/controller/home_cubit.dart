import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/home/domain/use_cases/get_breed_use_case.dart';
import 'package:pet_finder_app/features/home/presentation/controller/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetBreedUseCase getBreedUseCase;
  HomeCubit(this.getBreedUseCase) : super(HomeInitial());

  Future<void> getBreeds() async {
    emit(GetBreedsLoading());
    final result = await getBreedUseCase.call();
    result.when(
      success: (list) => emit(GetBreedsSuccess(list)),
      failure: (error) => emit(GetBreedsError(error)),
    );
  }
}
