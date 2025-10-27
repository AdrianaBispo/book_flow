import 'package:flutter/material.dart';
import 'package:myapp/core/core.dart';
import 'package:myapp/modules/biblioteca/presenter/widgets/biblioteca_book_card.dart';


final List<Map<String, String>> mockFavoriteBooks = [
  {
    'title': 'O Estranho Caso do Dr. Jekyll e Mr. Hyde',
    'author': 'Robert Louis Stevenson',
    'genre': 'Gótico',
  },
  {'title': '1984', 'author': 'George Orwell', 'genre': 'Distopia'},
  {
    'title': 'Cem Anos de Solidão',
    'author': 'Gabriel García Márquez',
    'genre': 'Realismo Mágico',
  },
  {
    'title': 'A Revolução dos Bichos',
    'author': 'George Orwell',
    'genre': 'Sátira Política',
  },
  {
    'title': 'O Pequeno Príncipe',
    'author': 'Antoine de Saint-Exupéry',
    'genre': 'Fábula',
  },
  {
    'title': 'Orgulho e Preconceito',
    'author': 'Jane Austen',
    'genre': 'Romance',
  },
];

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
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: mockFavoriteBooks.length,
        itemBuilder: (context, index) {
          final book = mockFavoriteBooks[index];
          return BibliotecaBookCard(
            title: book['title']!,
            author: book['author']!,
            genre: book['genre']!,
            imageUrl:
                'https://www.gutenberg.org/cache/epub/18452/pg18452.cover.medium.jpg', // Usado para o placeholder de cor
          );
        },
        separatorBuilder: (context, index) =>
            Divider(color: Theme.of(context).dividerColor, height: 24),
      ),
    );
  }

  Widget _buildSearchBar() {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: _searchController,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: AppColors.lightBackground,
        ),
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
}
