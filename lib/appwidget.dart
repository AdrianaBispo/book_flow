import 'package:flutter/material.dart';
import 'package:myapp/l10n/app_localizations.dart';
import 'package:myapp/utils/utils.dart';
import 'core/core.dart';
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
        Provider<SearchDataSourceRemoteImpl>(
          create: (_) => SearchDataSourceRemoteImpl(
            Supabase.instance.client,
          ),
        ),
        Provider<SearchRepository>(
          create: (context) => SearchRepositoryImpl(
            dataSource: context.read<SearchDataSourceRemoteImpl>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(context.read<LoginRepository>()),
          ),
          // BlocProvider<HomeBloc>(
          //   create: (context) => HomeBloc(context.read<HomeRepository>()),
          // ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) => MaterialApp.router(
            title: 'Book Flow',
            locale: const Locale('pt', 'BR'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,      
            supportedLocales: AppLocalizations.supportedLocales,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            routerConfig: NavigationConfigs.routes,
          ),
        ),
      ),
    );
  }
}
