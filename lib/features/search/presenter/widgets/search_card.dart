import 'package:flutter/material.dart';
import 'package:myapp/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:myapp/app/app.dart';
import '../../search.dart';

class SearchCard extends StatefulWidget {
  final ResultSearchDto ebook;

  const SearchCard({super.key, required this.ebook});

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationConfigs.push(
          routePath: RoutePath.searchDetails,
          extra: widget.ebook,
        );
      },
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'book-cover-${widget.ebook.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: widget.ebook.coverUrl == ''
                    ? Image.asset(
                        AppAssets.notfound,
                        width: 70.w,
                        height: 100.h,
                        fit: BoxFit.contain,
                      )
                    : Image.network(
                        widget.ebook.coverUrl!,
                        width: 70.w,
                        height: 100.h,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Skeletonizer(
                            enabled: true,
                            child: Container(
                              width: 70.w,
                              height: 100.h,
                              color: AppColors.skeletonLoading,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                              AppAssets.notfound,
                              width: 70.w,
                              height: 100.h,
                              fit: BoxFit.contain,
                            ),
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
                    widget.ebook.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextTheme.of(
                      context,
                    ).titleSmall!.copyWith(fontFamily: 'PT Serif'),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    widget.ebook.author,
                    style: TextTheme.of(context).titleSmall,
                  ),
                  SizedBox(height: 8.h),
                  widget.ebook.genero!.isEmpty
                      ? const SizedBox.shrink()
                      : Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.purple20,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            widget.ebook.genero ?? '',
                            style: TextTheme.of(context).bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                ],
              ),
            ),

            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 16.r,
                color: AppColors.primaryPurple,
              ),

              onPressed: () {
                NavigationConfigs.push(
                  routePath: RoutePath.searchDetails,
                  extra: widget.ebook,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
