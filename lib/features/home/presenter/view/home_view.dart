import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/features/features.dart';
import 'package:myapp/shared/shared.dart';
import '../widgets/home_book_card.dart'; // I'll create this

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadHomeData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<HomeBloc>().add(LoadHomeData());
          },
          child: CustomScrollView(
            slivers: [
              _buildAppBar(),
              SliverToBoxAdapter(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return _buildLoading();
                    }
                    if (state is HomeFailure) {
                      return Center(child: Text(state.message));
                    }
                    if (state is HomeSuccess) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (state.recentBooks.isNotEmpty)
                            _buildSection(
                              title: AppLocalizations.of(context)!.readingNow,
                              child: _buildRecentList(state.recentBooks),
                            ),
                          _buildSection(
                            title: AppLocalizations.of(
                              context,
                            )!.recommendationsForYou,
                            child: _buildRecommendationList(
                              state.recommendations,
                            ),
                          ),
                          if (state.favoriteBooks.isNotEmpty)
                            _buildSection(
                              title: AppLocalizations.of(
                                context,
                              )!.favoritesTitle,
                              child: _buildFavoriteList(state.favoriteBooks),
                            ),
                          SizedBox(height: 32.h),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverPadding(
      padding: EdgeInsets.all(20.r),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Olá, Adriana!', // TODO: Get name from auth
                  style: TextTheme.of(context).headlineSmall!.copyWith(
                    fontFamily: 'PT Serif',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'O que vamos ler hoje?',
                  style: TextTheme.of(context).bodyMedium,
                ),
              ],
            ),
            CircleAvatar(
              radius: 24.r,
              backgroundImage: const AssetImage(
                AppAssets.notfound,
              ), // Replace with user image
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 12.r),
          child: Text(
            title,
            style: TextTheme.of(context).titleMedium!.copyWith(
              fontFamily: 'PT Serif',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child,
      ],
    );
  }

  Widget _buildRecentList(recentBooks) {
    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        scrollDirection: Axis.horizontal,
        itemCount: recentBooks.length,
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          final book = recentBooks[index];
          return HomeBookCard(
            title: book.title,
            author: book.author,
            coverUrl: book.coverPath,
            onTap: () {
              // Navigation to library detail or reader
            },
          );
        },
      ),
    );
  }

  Widget _buildRecommendationList(recommendations) {
    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        scrollDirection: Axis.horizontal,
        itemCount: recommendations.length,
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          final book = recommendations[index];
          return HomeBookCard(
            title: book.title,
            author: book.author,
            coverUrl: book.coverUrl ?? '',
            onTap: () {
              NavigationConfigs.push(
                routePath: RoutePath.searchDetails,
                extra: ResultSearchDto(
                  id: book.id,
                  title: book.title,
                  author: book.author,
                  coverUrl: book.coverUrl,
                  downloadUrl: book.downloadUrl,
                  genero: book.genero,
                  description: book.description,
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildFavoriteList(favoriteBooks) {
    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        scrollDirection: Axis.horizontal,
        itemCount: favoriteBooks.length,
        separatorBuilder: (_, context) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          final book = favoriteBooks[index];
          return HomeBookCard(
            title: book.title,
            author: book.author,
            coverUrl: book.coverUrl ?? '',
            onTap: () {
              // Navigate to details
            },
          );
        },
      ),
    );
  }

  Widget _buildLoading() {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(
          3,
          (index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20.r),
                child: Container(
                  width: 150.w,
                  height: 20.h,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 200.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  itemCount: 5,
                  itemBuilder: (_, context) => Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Container(
                      width: 120.w,
                      height: 180.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
