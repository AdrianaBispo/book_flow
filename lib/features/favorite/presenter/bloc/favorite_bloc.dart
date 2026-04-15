import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/dtos/favorit_dto.dart';
import '../../domain/domain.dart';
import 'package:myapp/features/favorite/presenter/presenter.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavoriteUsecaseImpl getFavorites;
  final AddFavoriteUsecaseImpl addFavorite;
  final RemoveFavoriteUsecaseImpl removeFavorite;
  final IsFavoriteUsecaseImpl isFavorite;

  FavoriteBloc({
    required this.getFavorites,
    required this.addFavorite,
    required this.removeFavorite,
    required this.isFavorite,
  }) : super(FavoriteInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<AddToFavorite>(_onAddFavorite);
    on<RemoveFromFavorite>(_onRemoveFavorite);
  }

  List<FavoritDto> _favorites = [];

  List<FavoritDto> get favorites => _favorites;

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

  Future<bool> _onIsFavorite(
    IsFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    final result = await isFavorite(param: event.bookId);
    result.fold(
      (failure) => emit(FavoriteFailure(failure)),
      (isFav) {
        emit(FavoriteIsFavorite(isFav));
        return isFav;
      },
    );
  }

  Future<void> _onAddFavorite(
    AddToFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
   
    final isFav = await _onIsFavorite(IsFavorite(bookId: event.bookId), emit);
 
    if (isFav) {
      final result = await addFavorite(param: event.bookId);
      result.fold(
        (failure) => emit(FavoriteFailure(failure)),
        (_) {
          emit(FavoriteAdded());
          add(LoadFavorites());
        },
      );
    }
  }

  Future<void> _onRemoveFavorite(
    RemoveFromFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    final result = await removeFavorite(param: event.bookId);
    result.fold(
      (failure) => emit(FavoriteFailure(failure)),
      (_) {
        emit(FavoriteSuccess('Removed'));
        add(LoadFavorites());
      },
    );
  }
}
