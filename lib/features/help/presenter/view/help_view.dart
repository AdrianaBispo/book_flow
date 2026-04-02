import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/core.dart';
import 'package:myapp/l10n/app_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/help_bloc.dart';
import '../bloc/help_event.dart';
import '../bloc/help_state.dart';

class HelpView extends StatefulWidget {
  const HelpView({super.key});

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  @override
  void initState() {
    super.initState();
    context.read<HelpBloc>().add(const HelpGetItemsStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.help),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(PhosphorIcons.caretLeft(PhosphorIconsStyle.regular)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocBuilder<HelpBloc, HelpState>(
        builder: (context, state) {
          if (state.status == HelpStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == HelpStatus.failure) {
            return Center(
              child: Text(
                state.errorMessage ?? AppLocalizations.of(context)!.unexpectedError,
              ),
            );
          }

          final l10n = AppLocalizations.of(context)!;

          return SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.helpHeaderTitle,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryPurple,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  l10n.helpHeaderSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.grey40,
                  ),
                ),
                SizedBox(height: 32.h),
                ...state.items.map((item) => _buildHelpTile(context, item, l10n)),
                SizedBox(height: 40.h),
                _buildContactSection(context, l10n),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHelpTile(
    BuildContext context,
    dynamic item,
    AppLocalizations l10n,
  ) {
    // Mapeamento simples de chaves para traduções
    final String title = _getLocalizedText(item.title, l10n);
    final String content = _getLocalizedText(item.content, l10n);

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.lightBorder80),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Icon(
          PhosphorIcons.question(PhosphorIconsStyle.regular),
          color: AppColors.primaryPurple,
        ),
        childrenPadding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
        expandedAlignment: Alignment.topLeft,
        children: [
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.grey40,
            ),
          ),
        ],
      ),
    );
  }

  String _getLocalizedText(String key, AppLocalizations l10n) {
    switch (key) {
      case 'faq1Title': return l10n.faq1Title;
      case 'faq1Content': return l10n.faq1Content;
      case 'faq2Title': return l10n.faq2Title;
      case 'faq2Content': return l10n.faq2Content;
      case 'faq3Title': return l10n.faq3Title;
      case 'faq3Content': return l10n.faq3Content;
      case 'faq4Title': return l10n.faq4Title;
      case 'faq4Content': return l10n.faq4Content;
      case 'faq5Title': return l10n.faq5Title;
      case 'faq5Content': return l10n.faq5Content;
      default: return key;
    }
  }

  Widget _buildContactSection(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.purple20.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Text(
            l10n.contactSupportLegend,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            l10n.contactSupportDescription,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 20.h),
          ElevatedButton.icon(
            onPressed: () {
              // Simular abertura de chat ou email
            },
            icon: Icon(PhosphorIcons.chatCircleText(PhosphorIconsStyle.regular)),
            label: Text(l10n.contactSupport),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50.h),
            ),
          ),
        ],
      ),
    );
  }
}
