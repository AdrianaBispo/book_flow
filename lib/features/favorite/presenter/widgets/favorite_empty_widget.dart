import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/shared/shared.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FavoriteEmptyWidget extends StatelessWidget {
  const FavoriteEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              PhosphorIcons.heartBreak(PhosphorIconsStyle.regular),
              size: 80.r,
              color: AppColors.lightBorder80,
            ),
            SizedBox(height: 16.h),
            Text(
              AppLocalizations.of(context)!.emptyFavoritesTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: AppColors.grey80,
                  ),
            ),
            SizedBox(height: 8.h),
            Text(
              AppLocalizations.of(context)!.emptyFavoritesSubtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.grey60,
                    fontSize: 14.sp,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
