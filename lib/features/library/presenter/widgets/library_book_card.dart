import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/shared/shared.dart';
import '../../domain/domain.dart';

class LibraryBookCard extends StatelessWidget {
  final LibraryEntity book;
  final VoidCallback onTap;

  const LibraryBookCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Capa do Livro
            Container(
              width: 70.w,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image:
                    book.coverPath.isNotEmpty &&
                        File(book.coverPath).existsSync()
                    ? DecorationImage(
                        image: FileImage(File(book.coverPath)),
                        fit: BoxFit.cover,
                      )
                    : const DecorationImage(
                        image: AssetImage(AppAssets.notfound),
                        fit: BoxFit.contain,
                      ),
              ),
            ),
            SizedBox(width: 12.w),

            // 2. Detalhes do Livro
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontFamily: 'PT Serif',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    book.author,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withAlpha(150),
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // Status Tag
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withAlpha(40),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      book.status == ReadingStatus.notStarted
                          ? AppLocalizations.of(context)!.newStatus
                          : AppLocalizations.of(context)!.readingStatus,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 3. Botão de Ação
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 22.w,
              height: 22.w,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                PhosphorIcons.play(PhosphorIconsStyle.fill),
                color: theme.colorScheme.onPrimary,
                size: 14.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
