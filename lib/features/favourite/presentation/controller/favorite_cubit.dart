import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_request_body.dart';
import 'package:pet_finder_app/features/favourite/domain/use_cases/add_favorite_use_case.dart';
import 'package:pet_finder_app/features/favourite/domain/use_cases/delete_favorite_use_case.dart';
import 'package:pet_finder_app/features/favourite/domain/use_cases/get_favorite_use_case.dart';
import 'package:pet_finder_app/features/favourite/presentation/controller/favorite_states.dart';

import '../../data/models/favorite_model.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit(
    this.addFavoriteUseCase,
    this.getFavoriteUseCase,
    this.deleteFavoriteUseCase,
  ) : super(FavoriteInitial());
  final AddFavoriteUseCase addFavoriteUseCase;
  final GetFavoriteUseCase getFavoriteUseCase;
  final DeleteFavoriteUseCase deleteFavoriteUseCase;

  final List<FavoriteModel> favorites = [];
  Future<void> addBreedToFavorite(
    FavoriteRequestBody favoriteRequestBody,
  ) async {
    emit(AddBreedToFavoriteLoading());
    final result = await addFavoriteUseCase.call(
      favoriteRequestBody: favoriteRequestBody,
    );
    result.when(
      success: (res) {
        getFavorites();
        emit(AddBreedToFavoriteSuccess(res));
      },
      failure: (error) => emit(AddBreedToFavoriteFailure(error)),
    );
  }

  Future<void> getFavorites() async {
    emit(GetFavoritesLoading());
    final result = await getFavoriteUseCase.call();
    result.when(
      success: (data) {
        favorites
          ..clear()
          ..addAll(data);
        emit(GetFavoritesSuccess(data));
      },
      failure: (error) => emit(GetFavoritesError(error)),
    );
  }

  Future<void> deleteFavorite(int favoriteId) async {
    emit(DeleteFavoriteLoading());
    final result = await deleteFavoriteUseCase.call(favoriteId);
    result.when(
      success: (res) {
        favorites.removeWhere((fav) => fav.id == favoriteId);
        emit(DeleteFavoriteSuccess(res));
      },
      failure: (error) => emit(DeleteFavoriteFailure(error)),
    );
  }

  bool isFavorite(String imageId) {
    return favorites.any((fav) => fav.imageId == imageId);
  }

  Future<void> toggleFavorite({
    required String imageId,
    required FavoriteRequestBody body,
    int? favoriteId,
  }) async {
    if (isFavorite(imageId)) {
      final fav = favorites.firstWhere((f) => f.imageId == imageId);
      await deleteFavorite(fav.id);
    } else {
      await addBreedToFavorite(body);
    }
    emit(ToggleFavoriteUpdated(List.from(favorites)));
  }
}
