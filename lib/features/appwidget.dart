import 'package:flutter/material.dart';
import 'package:myapp/features/features.dart';
import '../app/app.dart';
import '../shared/shared.dart';
import 'favorite/data/data.dart';

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
          create: (_) => SearchDataSourceRemoteImpl(Supabase.instance.client),
        ),
        Provider<SearchRepository>(
          create: (context) => SearchRepositoryImpl(
            dataSource: context.read<SearchDataSourceRemoteImpl>(),
          ),
        ),
        Provider<LoginWithEmailAndPasswordImpl>(
          create: (context) =>
              LoginWithEmailAndPasswordImpl(context.read<LoginRepository>()),
        ),
        Provider<SearchUsecaseImpl>(
          create: (context) =>
              SearchUsecaseImpl(context.read<SearchRepository>()),
        ),
        Provider<HelpDatasourceLocalImpl>(
          create: (_) => HelpDatasourceLocalImpl(),
        ),
        Provider<HelpRepositoryImpl>(
          create: (context) =>
              HelpRepositoryImpl(context.read<HelpDatasourceLocalImpl>()),
        ),
        Provider<GetHelpItemsImpl>(
          create: (context) =>
              GetHelpItemsImpl(context.read<HelpRepositoryImpl>()),
        ),
        // FAVORITE
        Provider<FavoriteDatasourceRemoteImpl>(
          create: (_) =>
              FavoriteDatasourceRemoteImpl(client: Supabase.instance.client),
        ),
        Provider<FavoriteRepository>(
          create: (context) => FavoriteRepositoryImpl(
            datasource: context.read<FavoriteDatasourceRemoteImpl>(),
          ),
        ),
        Provider<GetFavoriteUsecaseImpl>(
          create: (context) => GetFavoriteUsecaseImpl(
            repository: context.read<FavoriteRepository>(),
          ),
        ),
        Provider<RemoveFavoriteUsecaseImpl>(
          create: (context) => RemoveFavoriteUsecaseImpl(
            repository: context.read<FavoriteRepository>(),
          ),
        ),
        Provider<AddFavoriteUsecaseImpl>(
          create: (context) =>
              AddFavoriteUsecaseImpl(context.read<FavoriteRepository>()),
        ),
        // LIBRARY
        Provider<LibraryRemoteDataSourceImpl>(
          create: (_) => LibraryRemoteDataSourceImpl(),
        ),
        Provider<LibraryLocalDataSourceImpl>(
          create: (context) => LibraryLocalDataSourceImpl(
            Hive.box('library_box'),
            context.read<LibraryRemoteDataSourceImpl>(),
          ),
        ),
        Provider<LibraryRepositoryImpl>(
          create: (context) => LibraryRepositoryImpl(
            localDataSource: context.read<LibraryLocalDataSourceImpl>(),
            remoteDataSource: context.read<LibraryRemoteDataSourceImpl>(),
          ),
        ),
        Provider<GetListBooksUsecaseImpl>(
          create: (context) =>
              GetListBooksUsecaseImpl(context.read<LibraryRepositoryImpl>()),
        ),
        Provider<AddBookInLibraryUsecaseImpl>(
          create: (context) => AddBookInLibraryUsecaseImpl(
            context.read<LibraryRepositoryImpl>(),
          ),
        ),
        Provider<RemoveBookFromLibraryUsecaseImpl>(
          create: (context) => RemoveBookFromLibraryUsecaseImpl(
            context.read<LibraryRepositoryImpl>(),
          ),
        ),
        Provider<OpenBookUsecaseImpl>(
          create: (context) =>
              OpenBookUsecaseImpl(context.read<LibraryRepositoryImpl>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(
              usecases: context.read<LoginWithEmailAndPasswordImpl>(),
            ),
          ),
          BlocProvider<SearchBloc>(
            create: (context) =>
                SearchBloc(usecaseSearch: context.read<SearchUsecaseImpl>()),
          ),
          BlocProvider<HelpBloc>(
            create: (context) =>
                HelpBloc(getHelpItems: context.read<GetHelpItemsImpl>()),
          ),
          BlocProvider<LibraryBloc>(
            create: (context) => LibraryBloc(
              getListBooks: context.read<GetListBooksUsecaseImpl>(),
              addBook: context.read<AddBookInLibraryUsecaseImpl>(),
              removeBook: context.read<RemoveBookFromLibraryUsecaseImpl>(),
              openBook: context.read<OpenBookUsecaseImpl>(),
            ),
          ),
          BlocProvider<FavoriteBloc>(
            create: (context) => FavoriteBloc(
              getFavorites: context.read<GetFavoriteUsecaseImpl>(),
              addFavorite: context.read<AddFavoriteUsecaseImpl>(),
              removeFavorite: context.read<RemoveFavoriteUsecaseImpl>(),
            ),
          ),
        ],

        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) => SkeletonizerConfig(
            data: SkeletonizerConfigData(
              containersColor: AppColors.skeletonLoading,
              effect: ShimmerEffect(
                baseColor: AppColors.skeletonLoading,
                highlightColor: AppColors.skeletonHighlight,
              ),
            ),
            child: MaterialApp.router(
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
      ),
    );
  }
}
