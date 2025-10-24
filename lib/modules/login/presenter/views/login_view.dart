import 'package:flutter/material.dart';
import 'package:myapp/core/core.dart';
import '../../../modules.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Login realizado com sucesso!',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.lightBackground,
                ),
              ),
              backgroundColor: AppColors.success,
            ),
          );
          context.go('/home');
        } else if (state.status == LoginStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage ?? 'Erro desconhecido',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.lightBackground,
                ),
              ),
              backgroundColor: AppColors.error,
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
                      child: const Icon(
                        Icons.local_library,
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
                      'Sua biblioteca digital',
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
