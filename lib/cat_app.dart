import 'package:cat_app/router/navigator_router.dart';
import 'package:flutter/material.dart';
import 'package:ui/util/application.dart';
import 'package:ui/resources/theme/theme.dart';

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class CatApp extends StatefulWidget {
  const CatApp({super.key});

  @override
  State<CatApp> createState() => _CatAppState();
}

class _CatAppState extends State<CatApp> with NavigatorRouter {
  @override
  Widget build(BuildContext context) {
    Application().appNavigatorKey = appNavigatorKey;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      restorationScopeId: "restoration_scope_id",
      themeMode: ThemeMode.light,
      title: 'Cat App',
      theme: Themes.materialLightTheme,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
