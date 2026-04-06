import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/core.dart';
import 'package:myapp/App/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/library_bloc.dart';
import '../bloc/library_event.dart';
import '../bloc/library_state.dart';
import '../widgets/library_book_card.dart';

class BibliotecaView extends StatefulWidget {
  const BibliotecaView({super.key});

  @override
  State<BibliotecaView> createState() => _BibliotecaViewState();
}

class _BibliotecaViewState extends State<BibliotecaView> {
  @override
  void initState() {
    super.initState();
    context.read<LibraryBloc>().add(LoadLibrary());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.myLibrary),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, size: 24.r),
            onPressed: () => context.read<LibraryBloc>().add(LoadLibrary()),
          ),
        ],
      ),
      body: BlocBuilder<LibraryBloc, LibraryState>(
        builder: (context, state) {
          if (state is LibraryLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is LibraryFailure) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 48.r, color: Colors.grey),
                    SizedBox(height: 16.h),
                    Text(
                      l10n.errorLoadingLibrary,
                      textAlign: TextAlign.center,
                      style: TextTheme.of(context).bodyMedium?.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TextButton(
                      onPressed: () => context.read<LibraryBloc>().add(LoadLibrary()),
                      child: Text(
                        l10n.tryAgain,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is LibraryLoaded) {
            final books = state.books;

            if (books.isEmpty) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.library_books, size: 64.r, color: AppColors.grey20),
                      SizedBox(height: 24.h),
                      Text(
                        l10n.emptyLibraryTitle,
                        textAlign: TextAlign.center,
                        style: TextTheme.of(context)
                            .titleLarge
                            ?.copyWith(
                              color: AppColors.grey60,
                              fontSize: 18.sp,
                            ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        l10n.emptyLibrarySubtitle,
                        textAlign: TextAlign.center,
                        style: TextTheme.of(context)
                            .bodyMedium
                            ?.copyWith(
                              color: AppColors.grey40,
                              fontSize: 14.sp,
                            ),
                      ),
                    ],
                  ),
                ),
              );
            }

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
                    onTap: () => context.read<LibraryBloc>().add(OpenBook(book.epubPath)),
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}


