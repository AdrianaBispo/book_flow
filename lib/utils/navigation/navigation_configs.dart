import 'package:flutter/material.dart';
import 'package:myapp/core/core.dart';
import 'route_path.dart';
import 'package:myapp/modules/modules.dart';

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
      ShellRoute(
        builder: (context, state, child) {
          return AppScaffold(child: child);
        },
        navigatorKey: shellNavigationKey,
        routes: [
          GoRoute(
            path: RoutePath.home,
            builder: (_, state) => const HomeView(),
            parentNavigatorKey: shellNavigationKey,
            name: 'HOME',
          ),
        ],
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
