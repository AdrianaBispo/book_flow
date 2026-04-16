import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/features/features.dart';
import 'package:myapp/shared/shared.dart';

class DetailsSearchActionButtonsWidget extends StatelessWidget {
  final ResultSearchDto ebook;

  const DetailsSearchActionButtonsWidget({super.key, required this.ebook});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: BlocListener<LibraryBloc, LibraryState>(
        listener: (context, state) {
          if (state is LibraryLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.primaryPurple,
                content: Text(
                  AppLocalizations.of(context)!.detailsAddedToLibrarySnack,
                ),
              ),
            );
          } else if (state is LibraryFailure) {
            // Optional: show error snackbar
          }
        },
        child: BlocBuilder<LibraryBloc, LibraryState>(
          builder: (context, state) {
            bool isInLibrary = false;
            if (state is LibraryLoaded) {
              isInLibrary = state.books.any((b) => b.id == ebook.id.toString());
            }
            return SizedBox(
              width: double.infinity,
              child: ElevatedButton(
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
                              epubPath: ebook.downloadUrl ?? '',
                              status: ReadingStatus.notStarted,
                            ),
                          ),
                        );
                      },
                child: Text(
                  isInLibrary
                      ? AppLocalizations.of(context)!.detailsInLibrary
                      : AppLocalizations.of(context)!.detailsAddToLibrary,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
