import 'package:flutter/material.dart';
import 'package:myapp/l10n/app_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          context.go(RoutePath.home);
        } else if (state.status == LoginStatus.databaseError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.error,
              content: Text(
                AppLocalizations.of(context)!.databaseErrorMessage,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                   color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          );
        } else if (state.status == LoginStatus.emailNotConfirmed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.error,
              content: Text(
                AppLocalizations.of(context)!.emailNotConfirmed,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                   color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          );
        } else if (state.status == LoginStatus.invalidCredentials) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.error,
              content: Text(
                AppLocalizations.of(context)!.invalidCredentials,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                   color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          );
        }else if (state.status == LoginStatus.unknownError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.error,
              content: Text(
                AppLocalizations.of(context)!.unexpectedError,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                   color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40.h),

                // Logo e título
                Column(
                  children: [
                    Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryPurple,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Icon(
                        PhosphorIcons.bookOpenText(PhosphorIconsStyle.regular),
                        size: 50.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'BookFlow',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      AppLocalizations.of(context)!.digitalLibrary,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),

                SizedBox(height: 48.h),

                // Formulário
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
