import 'package:equatable/equatable.dart';
import 'package:pet_finder_app/features/home/domain/entities/breed_entity.dart';

sealed class HomeStates extends Equatable {
  const HomeStates();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeStates {}

class GetBreedsLoading extends HomeStates {}

class GetBreedsSuccess extends HomeStates {
  final List<BreedEntity> breeds;
  const GetBreedsSuccess(this.breeds);
}

class GetBreedsError extends HomeStates {
  final String message;
  const GetBreedsError(this.message);
}
