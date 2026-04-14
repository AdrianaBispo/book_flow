import 'package:myapp/app/exceptions/app_exception.dart';
import 'package:myapp/features/favorite/domain/entities/favorit_entity.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<FavoritEntity> favorites;
  FavoriteLoaded(this.favorites);
}

class FavoriteFailure extends FavoriteState {
  final AppException failure;
  FavoriteFailure(this.failure);
}

class FavoriteSuccess extends FavoriteState {
  final String message;
  FavoriteSuccess(this.message);
}

class FavoriteAdded extends FavoriteState {}
