import 'package:domain/base/get_all_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:models/cat/cat_info.dart';

mixin GetBreedsRepository on GetAllRepository<CatInfo> {}

mixin GetBreedsUseCase on GetAllUseCase<CatInfo> {}

@Injectable(as: GetBreedsUseCase)
class GetBreedsUseCaseAdapter
    with GetAllUseCaseAdapter<CatInfo>
    implements GetBreedsUseCase {
  @override
  final GetBreedsRepository repository;

  GetBreedsUseCaseAdapter(this.repository);
}
