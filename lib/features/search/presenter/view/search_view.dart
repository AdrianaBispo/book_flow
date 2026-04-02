import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/core.dart';
import 'package:myapp/l10n/app_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../search.dart';

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
        toolbarHeight: 72,
        automaticallyImplyLeading: false,
        title: _buildSearchBar(),
        actions: [
          IconButton(
            icon: Icon(
              PhosphorIcons.x(PhosphorIconsStyle.regular),
              color: AppColors.lightCard,
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
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryPurple),
            );
          } else if (state is SearchSuccess) {
            return ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: state.results.length,
              itemBuilder: (context, index) {
                final ebook = state.results[index];
                return SearchCard(ebook: ebook as ResultSearchDto);
              },
              separatorBuilder: (context, index) =>
                  Divider(color: Theme.of(context).dividerColor, height: 24),
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
      height: 48,
      child: TextField(
        controller: _searchController,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: AppColors.lightBackground),
        cursorColor: AppColors.lightBackground,
        decoration: InputDecoration(
          fillColor: AppColors.purple20,
          hintText: AppLocalizations.of(context)!.searchBarHintText,
          labelStyle: Theme.of(context).inputDecorationTheme.labelStyle!
              .copyWith(color: AppColors.lightBackground),
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
            color: AppColors.lightBorder80,
          ),
          filled: true,
          enabledBorder: Theme.of(context).inputDecorationTheme.border!
              .copyWith(borderSide: BorderSide(color: AppColors.primaryPurple)),
          prefixIcon: IconButton(
            icon: Icon(
              PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.regular),
              color: AppColors.lightBackground,
            ),
            color: AppColors.lightBackground,
            onPressed: () {
              final searchText = _searchController.text;
              context.read<SearchBloc>().add(SearchTextChanged(searchText));
            },
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
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
            size: 80,
            color: AppColors.lightBorder80,
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.searchPlaceholder,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.grey40),
          ),
        ],
      ),
    );
  }
}
