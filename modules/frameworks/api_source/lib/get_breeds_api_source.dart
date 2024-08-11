import 'package:api_source/base/api_source.dart';
import 'package:api_source/utils/api_paths.dart';
import 'package:data/get_breeds_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:models/cat/cat_info.dart';

@Injectable(as: GetBreedsApiSource)
class GetBreedsApiSourceAdapter implements GetBreedsApiSource {
  final ApiSource _apiSource;

  GetBreedsApiSourceAdapter(this._apiSource);

  @override
  Future<List<CatInfo>> getAll([Map? args]) {
    const endpoint = ApiPaths.apiSearch;

    return _apiSource.getApi(endpoint, (value) {
      return (value as List<dynamic>?)?.map(
            (e) {
              return CatInfo.fromJson(e);
            },
          ).toList() ??
          [];
    }, options: Options(headers: ApiPaths.headers));
  }
}
