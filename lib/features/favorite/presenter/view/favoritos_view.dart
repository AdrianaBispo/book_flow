import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/shared/shared.dart';
import '../../../features.dart';

class FavoritosView extends StatefulWidget {
  const FavoritosView({super.key});

  @override
  State<FavoritosView> createState() => _FavoritosViewState();
}

class _FavoritosViewState extends State<FavoritosView> {
  bool get _isLoggedIn =>
      Supabase.instance.client.auth.currentUser != null;

  @override
  void initState() {
    super.initState();
    if (_isLoggedIn) {
      context.read<FavoriteBloc>().add(LoadFavorites());
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.favoritesTitle)),
      body: _isLoggedIn
          ? BlocConsumer<FavoriteBloc, FavoriteState>(
              listener: (context, state) {
                if (state is FavoriteAdded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(l10n.addedToFavoritesSnack),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                } else if (state is FavoriteSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(l10n.removedFromFavoritesSnack),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<FavoriteBloc>().add(LoadFavorites());
                  },
                  child: _buildBody(context, state, l10n),
                );
              },
            )
          : _buildLoginRequired(context, l10n),
    );
  }

  Widget _buildLoginRequired(BuildContext context, AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              PhosphorIcons.lockSimple(PhosphorIconsStyle.regular),
              size: 64.r,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
            SizedBox(height: 20.h),
            Text(
              l10n.favoritesLoginRequired,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    FavoriteState state,
    AppLocalizations l10n,
  ) {
    if (state is FavoriteLoaded) {
      if (state.favorites.isEmpty) {
        return const FavoriteEmptyWidget();
      }

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
            },
          );
        },
      );
    }

    if (state is FavoriteLoading || state is FavoriteInitial) {
      return Skeletonizer(
        enabled: true,
        child: ListView.separated(
          padding: EdgeInsets.all(16.r),
          itemCount: 5,
          itemBuilder: (context, index) {
            return FavoriteBookCard(
              title: 'Loading Book Title',
              author: 'Loading Author',
              genre: 'Genre',
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
        onRetry: () => context.read<FavoriteBloc>().add(LoadFavorites()),
      );
    }

    return const SizedBox.shrink();
  }
}
