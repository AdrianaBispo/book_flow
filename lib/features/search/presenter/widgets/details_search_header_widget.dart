import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/features/features.dart';
import 'package:myapp/shared/shared.dart';

class DetailsSearchHeaderWidget extends StatelessWidget {
  final ResultSearchDto ebook;

  const DetailsSearchHeaderWidget({super.key, required this.ebook});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.r),
            child: Text(
              ebook.title,
              style: TextTheme.of(
                context,
              ).headlineLarge!.copyWith(fontFamily: 'PT Serif'),
            ),
          ),
          if (ebook.author.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: 4.h, bottom: 12.h),
              child: Text(
                ebook.author,
                style: TextTheme.of(context).titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          if (ebook.genero != null && ebook.genero!.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                AppLocalizations.of(context)!.detailsGenreGeneral,
                style: TextTheme.of(context).bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                ),
              ),
            ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
