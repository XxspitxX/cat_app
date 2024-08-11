import 'package:api_source/base/api_source.dart';
import 'package:api_source/utils/api_paths.dart';
import 'package:data/get_cat_info_by_id_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:models/cat/cat_info.dart';

@Injectable(as: GetCatInfoByIdApiSource)
class GetCatInfoByIdApiSourceAdapter implements GetCatInfoByIdApiSource {
  final ApiSource _apiSource;

  GetCatInfoByIdApiSourceAdapter(this._apiSource);

  @override
  Future<CatInfo?> getById(String id, [Map? args]) {
    final endpoint = ApiPaths.apiSearchBreed(id);

    return _apiSource.getApi(
      endpoint,
      (value) {
        return CatInfo.fromJson(value);
      },
      options: Options(headers: ApiPaths.headers),
    );
  }
}
