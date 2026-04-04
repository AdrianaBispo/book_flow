import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/app.dart';
import '../../help.dart';
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
                state.errorMessage ??
                    AppLocalizations.of(context)!.unexpectedError,
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
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  l10n.helpHeaderSubtitle,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.grey60),
                ),
                SizedBox(height: 32.h),
                ...state.items.map(
                  (item) => HelpTileWidget(
                    title: item.title!,
                    content: item.content!,
                    l10n: l10n,
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
