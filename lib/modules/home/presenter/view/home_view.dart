import 'package:flutter/material.dart';
//import 'package:myapp/modules/modules.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/core.dart';
//import 'package:boo';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _fetchCurrentUser();
  }

  final SupabaseClient supabase = Supabase.instance.client; // agora funciona

  User? _currentUser;

  Future<void> _fetchCurrentUser() async {
    final user = supabase.auth.currentUser;
    setState(() {
      _currentUser = user;
    });
  }

  Future<void> _signOut() async {
    await supabase.auth.signOut();
    // Você deve adicionar aqui a navegação para a tela de login
    // Por exemplo: Navigator.of(co ntext).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Início',
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: AppColors.lightText),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: AppColors.lightText),
            onPressed: _signOut,
          ),
        ],
        backgroundColor: AppColors.primaryPurple,
      ),
      body: Center(
        child: _currentUser == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bem-vindo, ${_currentUser!.email ?? 'usuário'}!',
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  // Placeholder para a lista de livros do usuário
                  Text(
                    'Sua biblioteca pessoal estará aqui.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
      ),
    );
  }
}
