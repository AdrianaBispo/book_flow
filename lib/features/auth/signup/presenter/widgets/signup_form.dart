import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import '../../../../../shared/shared.dart';
import '../../data/dtos/signup_dto.dart';
import '../bloc/signup_bloc.dart';
import '../events/signup_event.dart';
import '../states/signup_state.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Campo de username
              TextFormFieldWidget(
                controller: _usernameController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.usernameLabel,
                  hintText: AppLocalizations.of(context)!.usernameHint,
                  prefixIcon: Icon(
                    PhosphorIcons.user(PhosphorIconsStyle.regular),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.usernameHint;
                  }
                  return null;
                },
              ),

              SizedBox(height: 16.h),

              // Campo de email
              TextFormFieldWidget(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.emailLabel,
                  hintText: AppLocalizations.of(context)!.emailHint,
                  prefixIcon: Icon(
                    PhosphorIcons.envelopeSimple(PhosphorIconsStyle.regular),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return AppLocalizations.of(context)!.invalidEmail;
                  }
                  return null;
                },
              ),

              SizedBox(height: 16.h),

              // Campo de senha
              TextFormFieldWidget(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.passwordLabel,
                  hintText: AppLocalizations.of(context)!.passwordHint,
                  prefixIcon: Icon(
                    PhosphorIcons.lock(PhosphorIconsStyle.regular),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? PhosphorIcons.eyeSlash(PhosphorIconsStyle.regular)
                          : PhosphorIcons.eye(PhosphorIconsStyle.regular),
                    ),
                    onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return AppLocalizations.of(context)!.invalidPassword;
                  }
                  return null;
                },
              ),

              SizedBox(height: 16.h),

              // Confirmação de senha
              TextFormFieldWidget(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.confirmPasswordLabel,
                  hintText: AppLocalizations.of(context)!.confirmPasswordHint,
                  prefixIcon: Icon(
                    PhosphorIcons.lock(PhosphorIconsStyle.regular),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? PhosphorIcons.eyeSlash(PhosphorIconsStyle.regular)
                          : PhosphorIcons.eye(PhosphorIconsStyle.regular),
                    ),
                    onPressed: () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
                  ),
                ),
                validator: (value) {
                  if (value != _passwordController.text) {
                    return AppLocalizations.of(context)!.passwordsDoNotMatch;
                  }
                  return null;
                },
              ),

              SizedBox(height: 24.h),

              // Botão de cadastro
              ElevatedButton(
                onPressed: state is SignupLoading
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          context.read<SignupBloc>().add(
                                SignupSubmitted(
                                  SignupDto(
                                    email: _emailController.text,
                                    username: _usernameController.text,
                                    password: _passwordController.text,
                                  ),
                                ),
                              );
                        }
                      },
                child: state is SignupLoading
                    ? SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.w,
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(AppLocalizations.of(context)!.createAccount),
              ),

              SizedBox(height: 24.h),

              // Voltar para login
              TextButton(
                onPressed: () => context.pop(),
                child: Text(
                  AppLocalizations.of(context)!.alreadyHaveAccount,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
