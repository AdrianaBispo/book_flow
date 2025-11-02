import 'package:flutter/material.dart';
import 'package:myapp/core/core.dart';
import 'package:myapp/l10n/app_localizations.dart';

class EmptyResultSearchWidget extends StatefulWidget {
  const EmptyResultSearchWidget({super.key});

  @override
  State<EmptyResultSearchWidget> createState() => _EmptyResultSearchWidgetState();
}

class _EmptyResultSearchWidgetState extends State<EmptyResultSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 80, color: AppColors.lightBorder80),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.emptyResultSearchTitle,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: AppColors.lightBorder80),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.emptyResultSearchSubtitle,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.lightBorder80),
          ),
        ],
      ),
    );
  
  }
}