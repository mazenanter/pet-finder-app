import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_request_body.dart';
import 'package:pet_finder_app/features/favourite/domain/use_cases/add_favorite_use_case.dart';
import 'package:pet_finder_app/features/favourite/domain/use_cases/get_favorite_use_case.dart';
import 'package:pet_finder_app/features/favourite/presentation/controller/favorite_states.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit(this.addFavoriteUseCase, this.getFavoriteUseCase)
    : super(FavoriteInitial());
  final AddFavoriteUseCase addFavoriteUseCase;
  final GetFavoriteUseCase getFavoriteUseCase;
  Future<void> addBreedToFavorite(
    FavoriteRequestBody favoriteRequestBody,
  ) async {
    emit(AddBreedToFavoriteLoading());
    final result = await addFavoriteUseCase.call(
      favoriteRequestBody: favoriteRequestBody,
    );
    result.when(
      success: (res) => emit(AddBreedToFavoriteSuccess(res)),
      failure: (error) => emit(AddBreedToFavoriteFailure(error)),
    );
  }

  Future<void> getFavorites() async {
    emit(GetFavoritesLoading());
    final result = await getFavoriteUseCase.call();
    result.when(
      success: (data) => emit(GetFavoritesSuccess(data)),
      failure: (error) => emit(GetFavoritesError(error)),
    );
  }
}
