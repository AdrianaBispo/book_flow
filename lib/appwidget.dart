import 'package:flutter/material.dart';
import 'core/theme/theme.dart';
import 'modules/login/login.dart';
import 'modules/home/home.dart';
import 'modules/modules.dart';
//
import 'package:myapp/modules/home/presenter/view/home_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginDatasouceRemoteImpl>(
          create: (_) => LoginDatasouceRemoteImpl(
            supabaseClient: Supabase.instance.client,
          ),
        ),
        Provider<LoginRepository>(
          create: (context) => LoginRepositoryImpl(
            dataSource: context.read<LoginDatasouceRemoteImpl>(),
          ),
        ),
        Provider<HomeDatasourceRemoteImpl>(
          create: (_) => HomeDatasourceRemoteImpl(
            supabaseClient: Supabase.instance.client,
          ),
        ),
        Provider<HomeRepository>(
          create: (context) => HomeRepositoryImpl(
            dataSource: context.read<HomeDatasourceRemoteImpl>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(context.read<LoginRepository>()),
          ),
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(context.read<HomeRepository>()),
          ),
        ],

        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) => MaterialApp(
            title: 'Flutter Demo',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,

            routes: {
              '/': (context) => const HomeView(), //LoginView(),
              'home': (context) => const HomeView(),
            },
          ),
        ),
      ),
    );
  }
}
