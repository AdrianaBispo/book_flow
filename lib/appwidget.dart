import 'package:flutter/material.dart';
import 'package:myapp/modules/home/presenter/view/home_view.dart';
import 'package:myapp/modules/login/data/datasources/remote/login_datasouce_remote.dart_impl.dart';
import 'core/theme/theme.dart';
import 'modules/login/login.dart';
import 'modules/modules.dart';

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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(context.read<LoginRepository>()),
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

            routes: {'/': (context) => const LoginView(),
            'home': (context) => const HomeView()},
          ),
        ),
      ),
    );
  }
}
