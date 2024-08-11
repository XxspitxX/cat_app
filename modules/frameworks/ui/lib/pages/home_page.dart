import 'package:flutter/material.dart';
import 'package:ui/blocs/home_bloc.dart';
import 'package:ui/pages/base_state.dart';
import 'package:ui/resources/values.dart';
import 'package:ui/widgets/list_cats_breeds.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  static const String route = 'home';

  @override
  State<HomePage> createState() => _HomePageState();

  static Widget buildPage(BuildContext context, Object? args) {
    return const HomePage();
  }
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Card(
          margin: const EdgeInsets.all(Values.paddingMedium),
          child: ListCatsBreeds(bloc: bloc),
        ),
      ),
    );
  }
}
