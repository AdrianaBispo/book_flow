import 'package:flutter/material.dart';
import 'package:myapp/core/core.dart';
import 'package:myapp/l10n/app_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../modules.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo de email
            TextFormField(
              key: const Key('emailInput_textField'),
              onChanged: (email) =>
                  context.read<LoginBloc>().add(LoginEmailChanged(email)),
              keyboardType: TextInputType.emailAddress,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.emailLabel,
                hintText: AppLocalizations.of(context)!.emailHint,
                prefixIcon: Icon(
                  PhosphorIcons.envelopeSimple(PhosphorIconsStyle.regular),
                ),
                errorText: state.email.isNotEmpty && !state.isEmailValid
                    ? AppLocalizations.of(context)!.invalidEmail
                    : null,
              ),
            ),

            const SizedBox(height: 16),

            // Campo de senha
            TextFormField(
              key: const Key('passwordInput_textField'),
              onChanged: (password) =>
                  context.read<LoginBloc>().add(LoginPasswordChanged(password)),
              obscureText: !state.isPasswordVisible,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.passwordLabel,
                hintText: AppLocalizations.of(context)!.passwordHint,
                prefixIcon: Icon(
                  PhosphorIcons.lock(PhosphorIconsStyle.regular),
                ),
                errorText: state.password.isNotEmpty && !state.isPasswordValid
                    ? AppLocalizations.of(context)!.invalidPassword
                    : null,
                suffixIcon: IconButton(
                  key: const Key('passwordVisibility_iconButton'),
                  icon: Icon(
                    state.isPasswordVisible
                        ? PhosphorIcons.eyeSlash(PhosphorIconsStyle.regular)
                        : PhosphorIcons.eye(PhosphorIconsStyle.regular),
                  ),
                  onPressed: () => context.read<LoginBloc>().add(
                    LoginTogglePasswordVisibility(),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Botão de login
            ElevatedButton(
              key: const Key('continue_raisedButton'),
              onPressed:
                  state.isFormValid && state.status != LoginStatus.loading
                  ? () => context.read<LoginBloc>().add(LoginSubmitted())
                  : null,

              child: state.status == LoginStatus.loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.lightBackground,
                        ),
                      ),
                    )
                  : Text(AppLocalizations.of(context)!.loginButton),
            ),

            const SizedBox(height: 24),

            // Divisor
            Row(
              children: [
                Expanded(child: Divider(color: Theme.of(context).dividerColor)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppLocalizations.of(context)!.orSeparator,
                    style: Theme.of(context).inputDecorationTheme.hintStyle,
                  ),
                ),
                Expanded(child: Divider(color: Theme.of(context).dividerColor)),
              ],
            ),

            const SizedBox(height: 24),

            // Botão de cadastro
            OutlinedButton(
              onPressed: () {
                // Navegar para tela de cadastro
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(color: AppColors.info), //.blue[800]!),
              ),
              child: Text(
                AppLocalizations.of(context)!.createAccount,
                style: Theme.of(context).inputDecorationTheme.labelStyle!
                    .copyWith(
                      color: AppColors.info,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),

            const SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Implementar página de ajuda
                  },
                  child: Text(
                    AppLocalizations.of(context)!.help,
                    style: Theme.of(context).inputDecorationTheme.hintStyle,
                  ),
                ),
                Text(
                  ' • ',
                  style: Theme.of(context).inputDecorationTheme.hintStyle,
                ),
                TextButton(
                  onPressed: () {
                    // Implementar página de termos
                  },
                  child: Text(
                    AppLocalizations.of(context)!.termsOfUse,
                    style: Theme.of(context).inputDecorationTheme.hintStyle,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
