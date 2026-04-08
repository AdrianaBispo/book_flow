import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import '../../../../../shared/shared.dart';
import '../../login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Campo de email
              TextFormFieldWidget(
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

              SizedBox(height: 16.h),
              // Campo de senha
              TextFormFieldWidget(
                key: const Key('passwordInput_textField'),
                onChanged: (password) => context.read<LoginBloc>().add(
                  LoginPasswordChanged(password),
                ),
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

              SizedBox(height: 24.h),
              // Botão de login
              ElevatedButton(
                key: const Key('continue_raisedButton'),
                onPressed:
                    state.isFormValid && state.status != LoginStatus.loading
                    ? () => context.read<LoginBloc>().add(LoginSubmitted())
                    : null,

                child: state.status == LoginStatus.loading
                    ? SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.w,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.lightBackground,
                          ),
                        ),
                      )
                    : Text(AppLocalizations.of(context)!.loginButton),
              ),

              SizedBox(height: 24.h),
              // Divisor
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Theme.of(context).dividerColor),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ), // Responsivo
                    child: Text(
                      AppLocalizations.of(context)!.orSeparator,
                      style: Theme.of(context).inputDecorationTheme.hintStyle,
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Theme.of(context).dividerColor),
                  ),
                ],
              ),

              SizedBox(height: 24.h),
              // Botão de cadastro
              OutlinedButton(
                onPressed: () {
                  // Navegar para tela de cadastro
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                  ), // Usando altura responsiva
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12.r,
                    ), // Usando raio responsivo
                  ),
                  side: BorderSide(color: AppColors.info),
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

              SizedBox(height: 32.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      NavigationConfigs.push(routePath: RoutePath.help);
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
          ),
        );
      },
    );
  }
}
