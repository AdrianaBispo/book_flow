import 'package:flutter/material.dart';
import 'package:myapp/shared/shared.dart';
import 'package:myapp/app/app.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final void Function(String)? onSubmitted;
  final void Function()? onSearchPressed;
  final void Function(String)? onChanged;

  const SearchBarWidget({
    super.key,
    required this.controller,
    this.hintText,
    this.onSubmitted,
    this.onSearchPressed,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 38.h,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: theme.textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        cursorColor: Theme.of(context).scaffoldBackgroundColor,
        textAlignVertical: const TextAlignVertical(y: 0),
        decoration: InputDecoration(
          fillColor: AppColors.purple20,
          hintText: hintText ?? AppLocalizations.of(context)!.searchBarHintText,
          labelStyle:
              (theme.inputDecorationTheme.labelStyle ?? AppStyles.bodyMedium)
                  .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
          hintStyle: theme.inputDecorationTheme.hintStyle?.copyWith(
            color: Theme.of(
              context,
            ).scaffoldBackgroundColor.withValues(alpha: 0.8),
          ),
          filled: true,
          isDense: true,
          enabledBorder:
              (theme.inputDecorationTheme.enabledBorder
                          as OutlineInputBorder? ??
                      const OutlineInputBorder())
                  .copyWith(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
          focusedBorder:
              (theme.inputDecorationTheme.focusedBorder
                          as OutlineInputBorder? ??
                      const OutlineInputBorder())
                  .copyWith(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 40.w,
            maxHeight: 38.h,
          ),
          prefixIcon: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Icon(
              PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.regular),
              color: Theme.of(context).scaffoldBackgroundColor,
              size: 16.r,
            ),
            color: Theme.of(context).scaffoldBackgroundColor,
            onPressed: onSearchPressed,
          ),
          contentPadding: EdgeInsets.zero,
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
