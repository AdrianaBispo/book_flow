import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/shared/shared.dart';

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
