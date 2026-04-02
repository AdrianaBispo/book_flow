import 'package:flutter/material.dart';
import 'package:myapp/core/core.dart';
import 'package:myapp/l10n/app_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../modules.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          context.go('/home');
        } else if (state.status == LoginStatus.databaseError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.error,
              content: Text(
                AppLocalizations.of(context)!.databaseErrorMessage,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.lightBackground,
                ),
              ),
            ),
          );
        } else if (state.status == LoginStatus.emailNotConfirmed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.error,
              content: Text(
                AppLocalizations.of(context)!.emailNotConfirmed,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.lightBackground,
                ),
              ),
            ),
          );
        } else if (state.status == LoginStatus.invalidCredentials) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.error,
              content: Text(
                AppLocalizations.of(context)!.invalidCredentials,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.lightBackground,
                ),
              ),
            ),
          );
        }else if (state.status == LoginStatus.unknownError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.error,
              content: Text(
                AppLocalizations.of(context)!.unexpectedError,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.lightBackground,
                ),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),

                // Logo e título
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.primaryPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        PhosphorIcons.bookOpenText(PhosphorIconsStyle.regular),
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'BookFlow',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context)!.digitalLibrary,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),

                const SizedBox(height: 48),

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
