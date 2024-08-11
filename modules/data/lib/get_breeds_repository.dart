import 'package:data/base/api_source.dart';
import 'package:data/base/get_all_repository.dart';
import 'package:domain/get_breeds_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:models/cat/cat_info.dart';

mixin GetBreedsApiSource on GetAllApiSource<CatInfo> {}

@Injectable(as: GetBreedsRepository)
class GetBreedsRepositoryAdapter
    with GetAllRepositoryAdapter<CatInfo>
    implements GetBreedsRepository {
  @override
  final GetBreedsApiSource apiSource;

  GetBreedsRepositoryAdapter(this.apiSource);
}
