import 'package:data/base/api_source.dart';
import 'package:data/base/get_by_id_repository.dart';
import 'package:domain/get_cat_info_by_id_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:models/cat/cat_info.dart';

mixin GetCatInfoByIdApiSource on GetByIdApiSource<CatInfo> {}

@Injectable(as: GetCatInfoByIdRepository)
class GetCatInfoByIdRepositoryAdapter
    with GetByIdRepositoryAdapter<CatInfo>
    implements GetCatInfoByIdRepository {
  @override
  final GetCatInfoByIdApiSource apiSource;

  GetCatInfoByIdRepositoryAdapter(this.apiSource);
}
