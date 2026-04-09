import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/shared/shared.dart';

class EmptyResultSearchWidget extends StatelessWidget {
  const EmptyResultSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.regular),
            size: 80.r,
            color: AppColors.lightBorder80,
          ),
          SizedBox(height: 16.h),
          Text(
            AppLocalizations.of(context)!.emptyResultSearchTitle,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.lightBorder80),
          ),
        ],
      ),
    );
  }
}
