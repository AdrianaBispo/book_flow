import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/shared/shared.dart';

import '../../../features.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final TextEditingController _searchController = TextEditingController();
  late SearchBloc blocSearch;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    blocSearch = context.read<SearchBloc>();
    blocSearch.add(SearchTextChanged(''));
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72.h,
        automaticallyImplyLeading: false,
        title: _buildSearchBar(),
        actions: [
          IconButton(
            icon: Icon(
              PhosphorIcons.x(PhosphorIconsStyle.regular),
              color: AppColors.lightCard,
              size: 24.r,
            ),
            onPressed: () {
              _searchController.clear();
              context.read<SearchBloc>().add(const SearchCleared());
            },
          ),
        ],
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchInitial) {
            return _buildInitialState();
          } else if (state is SearchLoading) {
            return Skeletonizer(
              enabled: true,
              child: ListView.separated(
                padding: EdgeInsets.all(16.r),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return SearchCard(
                    ebook: ResultSearchDto(
                      id: 0,
                      title: '',
                      author: '',
                      coverUrl: '',
                      genero: '',
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    Divider(color: Theme.of(context).dividerColor, height: 24.h),
              ),
            );
          } else if (state is SearchSuccess) {
            return ListView.separated(
              padding: EdgeInsets.all(16.r),
              itemCount: state.results.length,
              itemBuilder: (context, index) {
                final ebook = state.results[index];
                return SearchCard(ebook: ebook as ResultSearchDto);
              },
              separatorBuilder: (context, index) =>
                  Divider(color: Theme.of(context).dividerColor, height: 24.h),
            );
          } else if (state is SearchEmpty) {
            return EmptyResultSearchWidget();
          } else if (state is SearchError &&
              state.exception is DatabaseSearchException) {
            return SearchErroWidget(
              message: AppLocalizations.of(context)!.errorDatabaseSearch,
            );
          } else if (state is SearchError &&
              state.exception is UnknownSearchException) {
            return SearchErroWidget(
              message: AppLocalizations.of(context)!.unexpectedError,
            );
          } else if (state is SearchError) {
            return SearchErroWidget(
              message: AppLocalizations.of(context)!.errorUnknownSearch,
            );
          }
          return _buildInitialState();
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return SizedBox(
      height: 48.h,
      child: TextField(
        controller: _searchController,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(
              color: AppColors.lightBackground,
              fontSize: 14.sp,
            ),
        cursorColor: AppColors.lightBackground,
        decoration: InputDecoration(
          fillColor: AppColors.purple20,
          hintText: AppLocalizations.of(context)!.searchBarHintText,
          labelStyle: Theme.of(context).inputDecorationTheme.labelStyle!
              .copyWith(color: AppColors.lightBackground, fontSize: 14.sp),
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
            color: AppColors.lightBorder80,
            fontSize: 14.sp,
          ),
          filled: true,
          enabledBorder: Theme.of(context).inputDecorationTheme.border!
              .copyWith(borderSide: BorderSide(color: AppColors.primaryPurple)),
          prefixIcon: IconButton(
            icon: Icon(
              PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.regular),
              color: AppColors.lightBackground,
              size: 20.r,
            ),
            color: AppColors.lightBackground,
            onPressed: () {
              final searchText = _searchController.text;
              context.read<SearchBloc>().add(SearchTextChanged(searchText));
            },
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        ),
        onSubmitted: (value) {
          final searchText = _searchController.text;
          context.read<SearchBloc>().add(SearchTextChanged(searchText));
        },
      ),
    );
  }

  Widget _buildInitialState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.regular),
            size: 80.r,
            color: AppColors.lightBorder80,
          ),
          SizedBox(height: 16.h),
          Text(
            AppLocalizations.of(context)!.searchPlaceholder,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(
                  color: AppColors.grey40,
                  fontSize: 14.sp,
                ),
          ),
        ],
      ),
    );
  }
}
