import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui/blocs/splash_bloc.dart';
import 'package:ui/pages/base_state.dart';
import 'package:ui/pages/home_page.dart';
import 'package:ui/resources/assets.dart';
import 'package:ui/resources/values.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const String route = '/';
  @override
  State<SplashPage> createState() => _SplashPageState();
  static Widget buildPage(BuildContext context, Object? args) {
    return const SplashPage();
  }
}

class _SplashPageState extends BaseState<SplashPage, SplashBloc> {
  @override
  void initState() {
    super.initState();
    _initNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: Values.sizeSplash,
          height: Values.sizeSplash,
          child: Image.asset(Assets.splash),
        ),
      ),
    );
  }

  void _initNavigation() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      Future.delayed((Values.initNavigation), () {
        GoRouter.of(context).goNamed(HomePage.route);
      });
    });
  }
}
