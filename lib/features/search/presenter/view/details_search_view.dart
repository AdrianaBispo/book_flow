import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/features/features.dart';
import 'package:myapp/shared/shared.dart';

class DetailsSearchView extends StatelessWidget {
  final ResultSearchDto ebook;

  const DetailsSearchView({super.key, required this.ebook});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: Icon(
            PhosphorIcons.caretLeft(PhosphorIconsStyle.regular),
            color: Colors.white,
            size: 24.r,
          ),
          onPressed: () => NavigationConfigs.pop(),
        ),
        actions: [
          BlocListener<FavoriteBloc, FavoriteState>(
            listener: (context, state) {
              final l10n = AppLocalizations.of(context)!;
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
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              } else if (state is FavoriteFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).colorScheme.error,
                    content: Text(l10n.unexpectedError),
                  ),
                );
              }
            },
            child: BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                bool isFavorite = false;
                if (state is FavoriteLoaded) {
                  isFavorite = state.favorites
                      .any((f) => f.bookId == ebook.id);
                }

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: IconButton(
                    icon: Icon(
                      isFavorite
                          ? PhosphorIcons.heart(PhosphorIconsStyle.fill)
                          : PhosphorIcons.heart(PhosphorIconsStyle.regular),
                      color: Theme.of(context).colorScheme.primary,
                      size: 28.r,
                    ),
                    onPressed: () {
                      // O bloc trata o toggle internamente
                      context.read<FavoriteBloc>().add(
                        AddToFavorite(ebook.id),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 12.w),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsSearchCoverWidget(ebook: ebook),
              DetailsSearchHeaderWidget(ebook: ebook),
              if (ebook.description != null && ebook.description!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.r,
                    right: 20.r,
                    bottom: 12.r,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.detailsDescriptionTitle,
                    style: TextTheme.of(
                      context,
                    ).titleMedium!.copyWith(fontFamily: 'PT Serif'),
                  ),
                ),
              if (ebook.description != null && ebook.description!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.fromLTRB(20.r, 0, 20.r, 32.r),
                  child: Text(
                    ebook.description ?? '',
                    style: TextTheme.of(context).bodyMedium,
                  ),
                ),

              //TODO: Implementar essas informações no banco de dados
              // Padding(
              //   padding: EdgeInsets.fromLTRB(20.r, 0, 20.r, 12.r),
              //   child: Text(
              //     AppLocalizations.of(context)!.detailsInfoTitle,
              //     style: TextTheme.of(
              //       context,
              //     ).titleMedium!.copyWith(fontFamily: 'PT Serif'),
              //   ),
              // ),
              //  const DetailsSearchInfoGridWidget(),
              SizedBox(height: 16.h),
              DetailsSearchActionButtonsWidget(ebook: ebook),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
