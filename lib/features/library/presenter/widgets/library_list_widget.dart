import 'package:flutter/material.dart';
import 'package:myapp/shared/shared.dart';
import '../../../features.dart';

class LibraryListWidget extends StatelessWidget {
  final List<LibraryEntity> books;

  const LibraryListWidget({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<LibraryBloc>().add(LoadLibrary());
      },
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        itemCount: books.length,
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          final book = books[index];
          return LibraryBookCard(
            book: book,
            onTap: () =>
                context.read<LibraryBloc>().add(OpenBook(book.epubPath)),
          );
        },
      ),
    );
  }
}
