import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/features/features.dart';
import 'package:myapp/shared/shared.dart';

class DetailsSearchCoverWidget extends StatelessWidget {
  final ResultSearchDto ebook;

  const DetailsSearchCoverWidget({super.key, required this.ebook});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 180.h,
          color: Theme.of(context).colorScheme.primary,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 50.h),
        ),
        Positioned(
          child: Center(
            child: Hero(
              tag: 'book-cover-${ebook.id}',
              child: Container(
                width: 180.w,
                height: 270.h,
                margin: EdgeInsets.only(top: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child:
                      ebook.coverUrl == ''
                          ? Image.asset(AppAssets.notfound, fit: BoxFit.cover)
                          : Image.network(
                            ebook.coverUrl!,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Skeletonizer(
                                enabled: true,
                                child: Container(
                                  color: AppColors.skeletonLoading,
                                ),
                              );
                            },
                          ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
