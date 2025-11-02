// import 'package:flutter/material.dart';
// import '../widgets/widgets.dart';

// final List<Map<String, String>> mockFavoriteBooks = [
//   {
//     'title': 'O Estranho Caso do Dr. Jekyll e Mr. Hyde',
//     'author': 'Robert Louis Stevenson',
//     'genre': 'Gótico',
//   },
//   {'title': '1984', 'author': 'George Orwell', 'genre': 'Distopia'},
//   {
//     'title': 'Cem Anos de Solidão',
//     'author': 'Gabriel García Márquez',
//     'genre': 'Realismo Mágico',
//   },
//   {
//     'title': 'A Revolução dos Bichos',
//     'author': 'George Orwell',
//     'genre': 'Sátira Política',
//   },
//   {
//     'title': 'O Pequeno Príncipe',
//     'author': 'Antoine de Saint-Exupéry',
//     'genre': 'Fábula',
//   },
//   {
//     'title': 'Orgulho e Preconceito',
//     'author': 'Jane Austen',
//     'genre': 'Romance',
//   },
// ];

// class BibliotecaView extends StatefulWidget {
//   const BibliotecaView({super.key});

//   @override
//   State<BibliotecaView> createState() => _BibliotecaViewState();
// }

// class _BibliotecaViewState extends State<BibliotecaView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Minha Bilioteca')),
//       body: ListView.separated(
//         padding: const EdgeInsets.all(16.0),
//         itemCount: mockFavoriteBooks.length,
//         itemBuilder: (context, index) {
//           final book = mockFavoriteBooks[index];
//           return BibliotecaBookCard(
//             title: book['title']!,
//             author: book['author']!,
//             genre: book['genre']!,
//             imageUrl:
//                 'https://www.gutenberg.org/cache/epub/18452/pg18452.cover.medium.jpg', // Usado para o placeholder de cor
//           );
//         },
//         separatorBuilder: (context, index) =>
//             Divider(color: Theme.of(context).dividerColor, height: 24),
//       ),
//     );
//   }
// }
