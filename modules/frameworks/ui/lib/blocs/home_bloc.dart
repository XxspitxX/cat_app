import 'package:domain/get_cat_info_by_id_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:models/cat/cat_info.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ui/blocs/bloc.dart';
import 'package:domain/get_breeds_use_case.dart';

@injectable
class HomeBloc extends Bloc {
  final GetBreedsUseCase _getBreedsUseCase;
  final GetCatInfoByIdUseCase _getCatInfoByIdUseCase;

  final _progressSearchButton = BehaviorSubject<bool>();
  final _catBreedSubject = BehaviorSubject<List<CatInfo>>();
  ValueStream<bool> get progressSearchStream => _progressSearchButton.stream;
  ValueStream<List<CatInfo>> get catBreedStream => _catBreedSubject.stream;

  Function(bool) get updateProgressSearch => _progressSearchButton.add;
  Function(List<CatInfo>) get updateBreeds => _catBreedSubject.add;

  HomeBloc(this._getBreedsUseCase, this._getCatInfoByIdUseCase);

  @override
  void dispose() {
    _progressSearchButton.close();
    _catBreedSubject.close();
  }

  Future<List<CatInfo>> getBreeds() async {
    List<CatInfo> catInfo = [];
    try {
      updateProgressSearch(true);

      catInfo = await _getBreedsUseCase.getAll();
      updateBreeds(catInfo);

      updateProgressSearch(false);
    } catch (e) {
      updateProgressSearch(false);
    }

    return catInfo;
  }

  Future<CatInfo?> getCatInfo(String? id) async {
    CatInfo? catInfo;
    try {
      updateProgressSearch(true);
      if (id != null) {
        catInfo = await _getCatInfoByIdUseCase.getById(id);
        int index = catBreedStream.value.indexWhere((item) => item.id == id);
        catBreedStream.value[index].breeds = catInfo?.breeds;
      }

      updateProgressSearch(false);
    } catch (e) {
      updateProgressSearch(false);
    }

    return catInfo;
  }
}
