import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ui/blocs/bloc.dart';

@injectable
class CatDetailsBloc extends Bloc {
  final _exampleSubject = BehaviorSubject<String>();

  ValueStream<String> get example => _exampleSubject.stream;

  @override
  void dispose() {
    _exampleSubject.close();
  }
}
