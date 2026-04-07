import 'package:flutter/material.dart';
import 'package:myapp/App/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const LibraryErrorWidget({
    super.key,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48.r,
              color: Theme.of(context).colorScheme.error,
            ),
            SizedBox(height: 16.h),
            Text(
              AppLocalizations.of(context)!.errorLoadingLibrary,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.of(context).bodyMedium?.copyWith(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 12.h),
            TextButton(
              onPressed: onRetry,
              child: Text(
                l10n.tryAgain,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
