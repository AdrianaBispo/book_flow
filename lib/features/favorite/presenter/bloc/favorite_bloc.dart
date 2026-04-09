import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/domain.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/features/favorite/presenter/presenter.dart';


class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavoriteUsecaseImpl getFavorites;
  final AddFavoriteUsecaseImpl addFavorite;
  final RemoveFavoriteUsecaseImpl removeFavorite;

  FavoriteBloc({
    required this.getFavorites,
    required this.addFavorite,
    required this.removeFavorite,
  }) : super(FavoriteInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<AddToFavorite>(_onAddFavorite);
    on<RemoveFromFavorite>(_onRemoveFavorite);
  }

  Future<void> _onLoadFavorites(LoadFavorites event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    final result = await getFavorites();
    result.fold(
      (failure) => emit(FavoriteFailure(failure)),
      (favorites) => emit(FavoriteLoaded(favorites)),
    );
  }

  Future<void> _onAddFavorite(AddToFavorite event, Emitter<FavoriteState> emit) async {
    final result = await addFavorite(param: event.bookId);
    result.fold(
      (failure) => emit(FavoriteFailure(failure)),
      (_) => add(LoadFavorites()),
    );
  }

  Future<void> _onRemoveFavorite(RemoveFromFavorite event, Emitter<FavoriteState> emit) async {
    final result = await removeFavorite(param: event.bookId);
    result.fold(
      (failure) => emit(FavoriteFailure(failure)),
      (_) => add(LoadFavorites()),
    );
  }
}
