import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:ui/blocs/bloc.dart';

abstract class BaseState<T extends StatefulWidget, B extends Bloc>
    extends State<T> {
  late B bloc;

  @override
  void initState() {
    super.initState();
    bloc = _createBlocInstance();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  
  B _createBlocInstance() {
    return GetIt.instance<B>();
  }
}
