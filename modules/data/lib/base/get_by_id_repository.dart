import 'package:data/base/api_source.dart';
import 'package:domain/base/get_by_id_use_case.dart';

mixin GetByIdRepositoryAdapter<T> implements GetByIdRepository<T> {
  ApiSource get apiSource;

  @override
  Future<T?> getById(String id, [Map? args]) {
    return (apiSource as GetByIdApiSource<T>).getById(id, args);
  }
}
