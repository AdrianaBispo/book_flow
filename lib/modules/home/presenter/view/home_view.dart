import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../home.dart';
import '../../../../core/core.dart';
//import 'package:boo';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late HomeBloc _controller;
  //EbookDto? selectedBook;
  final SupabaseClient supabase = Supabase.instance.client;
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _fetchCurrentUser();
    _controller = context.read<HomeBloc>();
    _controller.add(
      FetchRecentBooks(userId: supabase.auth.currentUser?.id ?? ''),
    );
  }

  Future<void> _fetchCurrentUser() async {
    final user = supabase.auth.currentUser;
    setState(() {
      _currentUser = user;
    });
  }

  Future<void> _signOut() async {
    //await supabase.auth.signOut();
    //Navigator.of(context).pushReplacementNamed('/login');
    _controller.add(
      FetchRecentBooks(userId: supabase.auth.currentUser?.id ?? ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (BuildContext context, HomeState state) {},
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is HomeErrorState) {
          return Scaffold(body: Center(child: Text('Erro: ${state.message}')));
        } else if (state is HomeLoadedState) {
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
                        Text('state: ${state.recommendedBooks}'),
                      ],
                    ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(child: Text('Estado desconhecido')),
          );
        }
      },
    );
  }
}
