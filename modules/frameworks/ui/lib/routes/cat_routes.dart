import 'package:flutter/widgets.dart';
import 'package:ui/pages/cat_details_page.dart';
import 'package:ui/pages/home_page.dart';
import 'package:ui/pages/splash_page.dart';

typedef OnPageBuilder = Widget Function(
  BuildContext context,
  Object? arguments,
);

class CatRoutes {
  CatRoutes._();

  static const splash = SplashPage.route;

  static Map<String, OnPageBuilder> routes = {
    SplashPage.route: SplashPage.buildPage,
    HomePage.route: HomePage.buildPage,
    CatDetailsPage.route: CatDetailsPage.buildPage
  };
}
