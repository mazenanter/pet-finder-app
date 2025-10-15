import 'package:equatable/equatable.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_response.dart';

import '../../data/models/favorite_model.dart';

sealed class FavoriteStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteStates {}

class AddBreedToFavoriteLoading extends FavoriteStates {}

class AddBreedToFavoriteSuccess extends FavoriteStates {
  final FavoriteResponse favoriteResponse;

  AddBreedToFavoriteSuccess(this.favoriteResponse);
}

class AddBreedToFavoriteFailure extends FavoriteStates {
  final String message;
  AddBreedToFavoriteFailure(this.message);
}

class GetFavoritesLoading extends FavoriteStates {}

class GetFavoritesSuccess extends FavoriteStates {
  final List<FavoriteModel> favorites;
  GetFavoritesSuccess(this.favorites);
}

class GetFavoritesError extends FavoriteStates {
  final String message;
  GetFavoritesError(this.message);
}

class DeleteFavoriteLoading extends FavoriteStates {}

class DeleteFavoriteSuccess extends FavoriteStates {
  final String message;
  DeleteFavoriteSuccess(this.message);
}

class DeleteFavoriteFailure extends FavoriteStates {
  final String message;
  DeleteFavoriteFailure(this.message);
}
