import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/dtos/favorit_dto.dart';
import '../../domain/domain.dart';
import 'package:myapp/features/favorite/presenter/presenter.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavoriteUsecaseImpl getFavorites;
  final AddFavoriteUsecaseImpl addFavorite;
  final RemoveFavoriteUsecaseImpl removeFavorite;
  final IsFavoriteUsecaseImpl isFavoriteUseCase;

  FavoriteBloc({
    required this.getFavorites,
    required this.addFavorite,
    required this.removeFavorite,
    required this.isFavoriteUseCase,
  }) : super(FavoriteInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<AddToFavorite>(_onAddFavorite);
    on<RemoveFromFavorite>(_onRemoveFavorite);
    on<IsFavorite>(_onIsFavorite);
  }

  List<FavoritDto> _favorites = [];

  List<FavoritDto> get favorites => _favorites;

  bool isFavorite = false;

  Future<void> _onLoadFavorites(
    LoadFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(FavoriteLoading());
    final result = await getFavorites();
    result.fold((failure) => emit(FavoriteFailure(failure)), (favorites) {
      _favorites = favorites.map((e) => FavoritDto.fromEntity(e)).toList();
      emit(FavoriteLoaded(favorites));
    });
  }

  Future<void> _onIsFavorite(
    IsFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    final result = await isFavoriteUseCase(param: event.bookId);
    result.fold(
      (failure) {
        isFavorite = false;
        emit(FavoriteFailure(failure));
      },
      (isFav) {
        isFavorite = isFav;
        emit(FavoriteIsFavorite(isFavorite));
      },
    );
  }

  Future<void> _onAddFavorite(
    AddToFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    final result = await addFavorite(param: event.bookId);
    result.fold((failure) => emit(FavoriteFailure(failure)), (_) {
      emit(FavoriteAdded());
      add(LoadFavorites());
    });
    await _onIsFavorite(IsFavorite(event.bookId), emit);
  }

  Future<void> _onRemoveFavorite(
    RemoveFromFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    final result = await removeFavorite(param: event.bookId);
    result.fold((failure) => emit(FavoriteFailure(failure)), (_) {
      emit(FavoriteSuccess('Removed'));
      add(LoadFavorites());
    });
    await _onIsFavorite(IsFavorite(event.bookId), emit);
  }
}
