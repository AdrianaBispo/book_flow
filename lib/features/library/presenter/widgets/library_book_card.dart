import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/core/core.dart';
import '../../domain/domain.dart';

class LibraryBookCard extends StatelessWidget {
  final LibraryEntity book;
  final VoidCallback onTap;

  const LibraryBookCard({
    super.key,
    required this.book,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(0.05),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80.w,
              height: 110.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(0.2),
                    blurRadius: 5.r,
                    offset: Offset(2.w, 2.h),
                  ),
                ],
                image: book.coverPath.isNotEmpty && File(book.coverPath).existsSync()
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
            SizedBox(width: 16.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextTheme.of(context).titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PT Serif',
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    book.author,
                    style: TextTheme.of(context).bodySmall?.copyWith(
                      color: AppColors.grey60,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  if (book.status != ReadingStatus.notStarted)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.r),
                          child: LinearProgressIndicator(
                            value: 0.1, // Placeholder since we don't have total pages yet
                            backgroundColor: AppColors.grey20,
                            valueColor: const AlwaysStoppedAnimation(AppColors.primaryPurple),
                            minHeight: 6.h,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          AppLocalizations.of(context)!.readingStatus,
                          style: TextTheme.of(context).labelSmall?.copyWith(
                            color: AppColors.primaryPurple,
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    )
                  else
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: AppColors.purple20,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.newStatus,
                        style: TextTheme.of(context).labelSmall?.copyWith(
                          color: AppColors.primaryPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Icon(
                Icons.play_circle_fill,
                color: AppColors.primaryPurple,
                size: 28.r,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
