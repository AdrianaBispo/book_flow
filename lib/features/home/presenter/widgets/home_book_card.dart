import 'package:flutter/material.dart';
import 'package:myapp/shared/shared.dart';
import 'package:myapp/app/app.dart';

class HomeBookCard extends StatelessWidget {
  final String title;
  final String author;
  final String coverUrl;
  final VoidCallback onTap;

  const HomeBookCard({
    super.key,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 120.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: coverUrl.isEmpty
                    ? Image.asset(
                        AppAssets.notfound,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    : Image.network(
                        coverUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Skeletonizer(
                            enabled: true,
                            child: Container(
                              color: AppColors.skeletonLoading,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          AppAssets.notfound,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextTheme.of(context).titleSmall!.copyWith(
                    fontFamily: 'PT Serif',
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 4.h),
            Text(
              author,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextTheme.of(context).bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
