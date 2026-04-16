import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import '../../../../../shared/shared.dart';
import '../bloc/signup_bloc.dart';
import '../states/signup_state.dart';
import '../widgets/signup_form.dart';
import '../domain/exceptions/signup_exceptions.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)!.signupSuccess),
              backgroundColor: Colors.green,
            ),
          );
          context.pop(); // Volta para o login após sucesso
        } else if (state is SignupFailure) {
          final message = state.exception is SignupException 
              ? (state.exception as SignupException).message 
              : AppLocalizations.of(context)!.unexpectedError;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () => context.pop(),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16.h),
                Text(
                  AppLocalizations.of(context)!.signupTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                const SignupForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
