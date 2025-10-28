import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/core.dart';
import 'package:myapp/modules/biblioteca/presenter/widgets/biblioteca_book_card.dart';
import 'package:myapp/modules/search/data/dtos/result_search_dto.dart';

import '../presenter.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
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
            icon: const Icon(Icons.close, color: AppColors.lightCard),
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
                return BibliotecaBookCard(ebook: ebook as ResultSearchDto);
              },
              separatorBuilder: (context, index) =>
                  Divider(color: Theme.of(context).dividerColor, height: 24),
            );
          } else if (state is SearchEmpty) {
            return _buildEmptyState();
          } else if (state is SearchError) {
            return _buildErrorState(context, state.message);
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
          hintText: 'Buscar livros',
          labelStyle: Theme.of(context).inputDecorationTheme.labelStyle!
              .copyWith(color: AppColors.lightBackground),
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
            color: AppColors.lightBorder80,
          ),
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: AppColors.lightBackground),
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
        onSubmitted: (value) {
          debugPrint('Buscando: $value');
        },
      ),
    );
  }

  Widget _buildInitialState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 80, color: AppColors.lightBorder80),
          const SizedBox(height: 16),
          Text(
            'Digite algo para buscar livros',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(color: AppColors.lightBorder80),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 80, color: AppColors.lightBorder80),
          const SizedBox(height: 16),
          Text(
            'Nenhum livro encontrado',
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: AppColors.lightBorder80),
          ),
          const SizedBox(height: 8),
          Text(
            'Tente buscar com outros termos',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.lightBorder80),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 80, color: AppColors.error),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                final searchText = _searchController.text;
                if (searchText.isNotEmpty) {
                  context.read<SearchBloc>().add(SearchTextChanged(searchText));
                }
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Tentar novamente'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.purple20,
                foregroundColor: AppColors.lightBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
