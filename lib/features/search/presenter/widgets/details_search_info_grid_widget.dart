import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/shared/shared.dart';

class DetailsSearchInfoGridWidget extends StatelessWidget {
  const DetailsSearchInfoGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoItem(
            context,
            AppLocalizations.of(context)!.detailsPagesLabel,
            AppLocalizations.of(context)!.detailsPagesValue,
            PhosphorIcons.bookOpen(PhosphorIconsStyle.fill),
          ),
          _buildInfoItem(
            context,
            AppLocalizations.of(context)!.detailsLanguageLabel,
            AppLocalizations.of(context)!.detailsLanguageValue,
            PhosphorIcons.translate(PhosphorIconsStyle.fill),
          ),
          _buildInfoItem(
            context,
            AppLocalizations.of(context)!.detailsReleaseLabel,
            AppLocalizations.of(context)!.detailsReleaseValue,
            PhosphorIcons.calendar(PhosphorIconsStyle.fill),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 24.r),
        SizedBox(height: 8.h),
        Text(value, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 4.h),
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).dividerColor,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
