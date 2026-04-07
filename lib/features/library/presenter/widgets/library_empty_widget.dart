import 'package:flutter/material.dart';
import 'package:myapp/App/ AppLocalizations.of(context)!/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryEmptyWidget extends StatelessWidget {
  const LibraryEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.library_books,
              size: 64.r,
              color: Theme.of(context).colorScheme.primary.withAlpha(50),
            ),
            SizedBox(height: 24.h),
            Text(
               AppLocalizations.of(context)!.emptyLibraryTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.of(context).titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
               AppLocalizations.of(context)!.emptyLibrarySubtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.of(context).bodyMedium?.copyWith(
                color: Theme.of(context).textTheme.of(context).bodyMedium?.color?.withAlpha(150),
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
