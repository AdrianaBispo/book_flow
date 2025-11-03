import 'package:flutter/material.dart';
import 'package:myapp/core/theme/app_colors.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SearchErroWidget extends StatelessWidget {
  final String message;
  const SearchErroWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              PhosphorIcons.warningCircle(PhosphorIconsStyle.regular),
              size: 80,
              color: AppColors.error,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
