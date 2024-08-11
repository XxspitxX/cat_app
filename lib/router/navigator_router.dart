import 'package:cat_app/cat_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui/pages/home_page.dart';
import 'package:ui/pages/splash_page.dart';
import 'package:ui/routes/cat_routes.dart';
import 'package:ui/util/application.dart';

mixin NavigatorRouter on State<CatApp> {
  Object? arguments;

  GoRouter get router {
    if (Application().globalRouter != null) {
      return Application().globalRouter!;
    }
    Application().globalRouter = GoRouter(
      initialLocation: CatRoutes.splash,
      routes: registerPages(),
      navigatorKey: Application().appNavigatorKey,
      errorBuilder: (context, state) => Text(state.error?.message ?? ''),
    );
    return Application().globalRouter!;
  }

  List<RouteBase> registerPages() {
    return CatRoutes.routes.entries.map((route) {
      return GoRoute(
        name: route.key,
        path: _getName(route.key),
        builder: (context, state) => _onGenerateRoute(state)!,
        parentNavigatorKey: Application().appNavigatorKey,
      );
    }).toList();
  }

  String _getName(String route) {
    if (route == CatRoutes.splash) {
      return route;
    }
    return "/$route";
  }

  Widget? _onGenerateRoute(GoRouterState settings) {
    final builder = CatRoutes.routes[settings.name];

    if (settings.extra != null) {
      arguments = settings.extra;
    }

    if (builder != null) {
      return builder(context, arguments);
    }

    assert(false, 'Need to implement ${settings.name}');

    return null;
  }

  String validateRedirect(String path, String? name) {
    if (name == null || name != HomePage.route) {
      return SplashPage.route;
    }
    return path;
  }

  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    return validateRedirect(state.matchedLocation, state.name);
  }
}
