import 'package:flutter/material.dart';
import 'package:myapp/utils/utils.dart';

class AppScaffold extends StatefulWidget {
  final Widget child;

  const AppScaffold({super.key, required this.child});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> with WidgetsBindingObserver {
  String route = '';
  final ValueNotifier<bool> _canGoBack = ValueNotifier<bool>(false);

  List<String> routesWithBottomBar = [RoutePath.home];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    route = NavigationConfigs.currentRoute;
    NavigationConfigs.routes.routerDelegate.addListener(_routeChangedListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, data) => _willPop,
      child: Center(),
    );
  }

  @override
  void dispose() {
    NavigationConfigs.routes.routerDelegate.removeListener(
      _routeChangedListener,
    );
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _routeChangedListener() {
    if (context.mounted) {
      setState(() {
        route = NavigationConfigs.currentRoute;
      });
    } else {
      route = NavigationConfigs.currentRoute;
    }

    Future.delayed(
      const Duration(milliseconds: 100),
      () => _canGoBack.value = NavigationConfigs.routes.canPop(),
    );
  }

  Future<bool> _willPop() async {
    if (NavigationConfigs.routes.canPop()) {
      NavigationConfigs.routes.pop();
      return false;
    } else {
      if (route != RoutePath.home) {
        NavigationConfigs.go(routePath: RoutePath.home);
        return false;
      }
      return true;
    }
  }
}
