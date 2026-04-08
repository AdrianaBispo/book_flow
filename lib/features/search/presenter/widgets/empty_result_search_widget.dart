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
            size: 80,
            color: AppColors.lightBorder80,
          ),
          const SizedBox(height: 16),
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
