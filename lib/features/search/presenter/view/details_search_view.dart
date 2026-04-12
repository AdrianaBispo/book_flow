import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/features/features.dart';
import 'package:myapp/shared/shared.dart';
import 'package:myapp/features/library/domain/entities/library_entity.dart';
import 'package:myapp/features/library/presenter/presenter.dart';
import 'package:myapp/features/favorite/presenter/presenter.dart';
import 'package:myapp/features/search/search.dart';

class DetailsSearchView extends StatelessWidget {
  final ResultSearchDto ebook;

  const DetailsSearchView({super.key, required this.ebook});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  SizedBox(height: 32.h),
                  _buildSectionTitle(context, 'Descrição'),
                  SizedBox(height: 12.h),
                  _buildDescription(context),
                  SizedBox(height: 32.h),
                  _buildSectionTitle(context, 'Informações'),
                  SizedBox(height: 16.h),
                  _buildInfoGrid(context),
                  SizedBox(height: 48.h),
                  _buildActionButtons(context),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400.h,
      pinned: true,
      backgroundColor: AppColors.primaryPurple,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryPurple,
                    AppColors.primaryPurple.withOpacity(0.8),
                    AppColors.lightBackground,
                  ],
                ),
              ),
            ),
            Center(
              child: Hero(
                tag: 'book-cover-${ebook.id}',
                child: Container(
                  width: 180.w,
                  height: 270.h,
                  margin: EdgeInsets.only(top: 40.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: ebook.coverUrl == ''
                        ? Image.asset(AppAssets.notfound, fit: BoxFit.cover)
                        : Image.network(
                            ebook.coverUrl!,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Skeletonizer(
                                enabled: true,
                                child: Container(
                                  color: AppColors.skeletonLoading,
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.r),
        onPressed: () => NavigationConfigs.pop(),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ebook.title,
          style: TextTheme.of(context).headlineLarge!.copyWith(
            fontFamily: 'PT Serif',
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          ebook.author,
          style: TextTheme.of(context).titleMedium!.copyWith(
            color: AppColors.primaryPurple,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            _buildBadge(
              context,
              ebook.genero ?? 'Geral',
              AppColors.purple20,
              AppColors.primaryPurple,
            ),
            SizedBox(width: 8.w),
            _buildBadge(
              context,
              'E-book',
              AppColors.secondaryYellow.withOpacity(0.2),
              AppColors.secondaryYellow.withOpacity(0.9),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(
    BuildContext context,
    String label,
    Color bgColor,
    Color textColor,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'PT Serif',
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      'Este é um livro incrível escrito por ${ebook.author}. Explore as páginas desta obra e mergulhe em uma jornada de conhecimento e entretenimento. A leitura é fundamental para o crescimento pessoal e intelectual.',
      style: TextStyle(color: AppColors.grey60, fontSize: 14.sp, height: 1.6),
    );
  }

  Widget _buildInfoGrid(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoItem(context, 'Páginas', '320', Icons.auto_stories_outlined),
        _buildInfoItem(
          context,
          'Linguagem',
          'Português',
          Icons.language_outlined,
        ),
        _buildInfoItem(
          context,
          'Lançamento',
          '2023',
          Icons.calendar_today_outlined,
        ),
      ],
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primaryPurple, size: 24.r),
        SizedBox(height: 8.h),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(color: AppColors.grey40, fontSize: 12.sp),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<LibraryBloc, LibraryState>(
            builder: (context, state) {
              bool isInLibrary = false;
              if (state is LibraryLoaded) {
                isInLibrary = state.books.any(
                  (b) => b.id == ebook.id.toString(),
                );
              }

              return ElevatedButton(
                onPressed: isInLibrary
                    ? null
                    : () {
                        context.read<LibraryBloc>().add(
                          AddBookToLibrary(
                            LibraryEntity(
                              id: ebook.id.toString(),
                              title: ebook.title,
                              author: ebook.author,
                              coverPath: ebook.coverUrl ?? '',
                              genre: ebook.genero ?? '',
                              epubPath: '',
                              status: ReadingStatus.notStarted,
                            ),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Adicionado à sua biblioteca!'),
                          ),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  backgroundColor: isInLibrary
                      ? AppColors.grey40
                      : AppColors.primaryPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  isInLibrary ? 'Na Biblioteca' : 'Adicionar à Biblioteca',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(width: 16.w),
        BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            bool isFavorite = false;
            if (state is FavoriteLoaded) {
              isFavorite = state.favorites.any((f) => f.id == ebook.id);
            }

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.primaryPurple),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.primaryPurple,
                  size: 28.r,
                ),
                onPressed: () {
                  if (isFavorite) {
                    context.read<FavoriteBloc>().add(
                      RemoveFromFavorite(ebook.id),
                    );
                  } else {
                    context.read<FavoriteBloc>().add(AddToFavorite(ebook.id));
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
