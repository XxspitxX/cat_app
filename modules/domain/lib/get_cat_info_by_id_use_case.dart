import 'package:domain/base/get_by_id_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:models/cat/cat_info.dart';

mixin GetCatInfoByIdRepository on GetByIdRepository<CatInfo> {}

mixin GetCatInfoByIdUseCase on GetByIdUseCase<CatInfo> {}

@Injectable(as: GetCatInfoByIdUseCase)
class GetCatInfoByIdUseCaseAdapter
    with GetByIdUseCaseAdapter<CatInfo>
    implements GetCatInfoByIdUseCase {
  @override
  final GetCatInfoByIdRepository repository;

  GetCatInfoByIdUseCaseAdapter(this.repository);
}
