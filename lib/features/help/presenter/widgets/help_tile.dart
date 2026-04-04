import 'package:flutter/material.dart';

import '../../../../app/app.dart';
import '../../../../shared/shared.dart';

class HelpTileWidget extends StatelessWidget {
  final String title;
  final String content;
  final AppLocalizations l10n;

  const HelpTileWidget({
    super.key,
    required this.l10n,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final title = _getLocalizedText(this.title, l10n);
    final content = _getLocalizedText(this.content, l10n);

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.lightBorder80),
      ),
      child: ExpansionTile(
        title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
        leading: Icon(
          PhosphorIcons.question(PhosphorIconsStyle.regular),
          color: Theme.of(context).colorScheme.primary,
        ),
        childrenPadding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
        expandedAlignment: Alignment.topLeft,
        children: [Text(content, style: Theme.of(context).textTheme.bodySmall)],
      ),
    );
  }

  String _getLocalizedText(String key, AppLocalizations l10n) {
    switch (key) {
      case 'faq1Title':
        return l10n.faq1Title;
      case 'faq1Content':
        return l10n.faq1Content;
      case 'faq2Title':
        return l10n.faq2Title;
      case 'faq2Content':
        return l10n.faq2Content;
      case 'faq3Title':
        return l10n.faq3Title;
      case 'faq3Content':
        return l10n.faq3Content;
      case 'faq4Title':
        return l10n.faq4Title;
      case 'faq4Content':
        return l10n.faq4Content;
      case 'faq5Title':
        return l10n.faq5Title;
      case 'faq5Content':
        return l10n.faq5Content;
      default:
        return key;
    }
  }
}
