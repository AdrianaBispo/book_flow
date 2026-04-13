import 'package:flutter/material.dart';
import 'package:myapp/shared/shared.dart';
import '../../../features.dart';

class FavoritosView extends StatefulWidget {
  const FavoritosView({super.key});

  @override
  State<FavoritosView> createState() => _FavoritosViewState();
}

class _FavoritosViewState extends State<FavoritosView> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(LoadFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Favoritos')),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<FavoriteBloc>().add(LoadFavorites());
        },
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoaded) {
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  final book = state.favorites[index];
                  return FavoriteBookCard(
                    title: book.title,
                    author: book.author,
                    genre: book.genero.toString(),
                    imageUrl: book.coverUrl.toString(),
                    onRemove: () {
                      context.read<FavoriteBloc>().add(
                        RemoveFromFavorite(book.id),
                      );
                      context.read<FavoriteBloc>().add(LoadFavorites());
                    },
                  );
                },
              );
            }
            if (state is FavoriteLoading) {
              return Skeletonizer(
                enabled: true,
                child: ListView.separated(
                  padding: EdgeInsets.all(16.r),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return FavoriteBookCard(
                      title: '',
                      author: '',
                      genre: '',
                      imageUrl: '',
                      onRemove: () {},
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: Theme.of(context).dividerColor,
                    height: 24.h,
                  ),
                ),
              );
            }
            if (state is FavoriteFailure) {
              return LibraryErrorWidget(
                onRetry: () =>
                    context.read<FavoriteBloc>().add(LoadFavorites()),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
