import 'package:flutter/material.dart';
import 'package:myapp/features/features.dart';
import '../app/app.dart';
import '../shared/shared.dart';

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
        // Provider<SearchDataSourceRemoteImpl>(
        //   create: (_) => SearchDataSourceRemoteImpl(Supabase.instance.client),
        // ),
        // Provider<SearchRepository>(
        //   create: (context) => SearchRepositoryImpl(
        //     dataSource: context.read<SearchDataSourceRemoteImpl>(),
        //   ),
        // ),
         Provider<LoginWithEmailAndPasswordImpl>(
           create: (context) => LoginWithEmailAndPasswordImpl(
             //dataSource: context.read<SearchDataSourceRemoteImpl>(),
            context.read<LoginRepository>(),
           ),
         ),
        // Provider<SearchUsecaseImpl>(
        //   create: (context) => SearchUsecaseImpl(context.read<SearchRepositoryImpl>()),

        // ),
        Provider<HelpDatasourceImpl>(create: (_) => HelpDatasourceImpl()),
        Provider<HelpRepositoryImpl>(
          create: (context) =>
              HelpRepositoryImpl(context.read<HelpDatasourceImpl>()),
        ),
        Provider<GetHelpItemsImpl>(
          create: (context) =>
              GetHelpItemsImpl(context.read<HelpRepositoryImpl>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(
               usecases: context.read<LoginWithEmailAndPasswordImpl>(),
            ),
          ),
          // BlocProvider<SearchBloc>(
          //   create: (context) =>
          //       SearchBloc(usecaseSearch: context.read<SearchUsecaseImpl>(),
          // ),
          // ),
          BlocProvider<HelpBloc>(
            create: (context) =>
                HelpBloc(getHelpItems: context.read<GetHelpItemsImpl>()),
          ),
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
