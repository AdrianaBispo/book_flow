import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/features/favorite/presenter/view/favoritos_view.dart';
import 'package:myapp/features/features.dart';

import '../../shared/shared.dart';

abstract class NavigationConfigs {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
  static final GlobalKey<NavigatorState> shellNavigationKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _globalNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static final routes = GoRouter(
    navigatorKey: _globalNavigatorKey,
    initialLocation: RoutePath.login,
    errorBuilder: (context, state) => const PageNotFound(),
    routes: [
      GoRoute(
        path: RoutePath.login,
        builder: (_, state) => LoginView(),
        name: 'LOGIN',
      ),
      GoRoute(
        path: RoutePath.help,
        builder: (_, state) => const HelpView(),
        name: 'HELP',
      ),
      ShellRoute(
        builder: (context, state, child) {
          return AppScaffold(child: child);
        },
        navigatorKey: shellNavigationKey,
        routes: [
          GoRoute(
            path: RoutePath.home,
            builder: (_, state) => const SearchView(),
            parentNavigatorKey: shellNavigationKey,
            name: 'HOME',
          ),
          GoRoute(
            path: RoutePath.search,
            builder: (_, state) => const SearchView(),
            parentNavigatorKey: shellNavigationKey,
            name: 'SEARCH',
          ),
          GoRoute(
            path: RoutePath.biblioteca,
            builder: (_, state) => const SearchView(),
            parentNavigatorKey: shellNavigationKey,
            name: 'BIBLIOTECA',
          ),
          GoRoute(
            path: RoutePath.favoritos,
            builder: (_, state) => const FavoritosView(),
            parentNavigatorKey: shellNavigationKey,
            name: 'FAVORITOS',
          ),
          GoRoute(
            path: RoutePath.perfil,
            builder: (_, state) => const SearchView(),
            parentNavigatorKey: shellNavigationKey,
            name: 'PERFIL',
          ),
        ],
      ),
      GoRoute(
        path: RoutePath.searchDetails,
        builder: (_, state) => DetailsSearchView(ebook: state.extra as ResultSearchDto),
        name: 'SEARCH_DETAILS',
      ),
    ],
  );
  static String get currentRoute {
    String route = '';
    RouteMatchList matchList;

    if (routes.routerDelegate.currentConfiguration.isNotEmpty) {
      final RouteMatch lastMatch =
          routes.routerDelegate.currentConfiguration.last;
      matchList = lastMatch is ImperativeRouteMatch
          ? lastMatch.matches
          : routes.routerDelegate.currentConfiguration;
    } else {
      matchList = routes.routerDelegate.currentConfiguration;
    }

    route = matchList.uri.toString();

    return route;
  }

  static bool get canGoBack {
    return routes.canPop();
  }

  static BuildContext get globalContext {
    if (_globalNavigatorKey.currentContext != null &&
        _globalNavigatorKey.currentContext!.mounted) {
      return _globalNavigatorKey.currentContext!;
    }
    throw ();
  }

  static BuildContext get scaffoldContext {
    if (scaffoldKey.currentContext != null &&
        scaffoldKey.currentContext!.mounted) {
      return scaffoldKey.currentContext!;
    }
    throw ();
  }

  static Future<T?> push<T extends Object?>({
    required String routePath,
    Object? extra,
  }) async {
    if (currentRoute == routePath ||
        (extra is String && currentRoute == extra)) {
      return null;
    }
    return GoRouter.of(globalContext).push(routePath, extra: extra);
  }

  static void pushReplacement({required String routePath, Object? extra}) {
    if (currentRoute == routePath ||
        (extra is String && currentRoute == extra)) {
      return;
    }
    GoRouter.of(globalContext).pushReplacement(routePath, extra: extra);
  }

  static void go({required String routePath, Object? extra}) {
    if (currentRoute == routePath ||
        (extra is String && currentRoute == extra)) {
      return;
    }
    GoRouter.of(globalContext).go(routePath, extra: extra);
  }

  static void pop<T>([T? value]) {
    if (GoRouter.of(globalContext).canPop()) {
      GoRouter.of(globalContext).pop(value);
    } else {
      go(routePath: RoutePath.home);
    }
  }
}
