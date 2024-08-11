//@GeneratedMicroModule;DataPackageModule;package:data/di/data_di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:data/get_breeds_repository.dart' as _i164;
import 'package:data/get_cat_info_by_id_repository.dart' as _i1058;
import 'package:domain/get_breeds_use_case.dart' as _i245;
import 'package:domain/get_cat_info_by_id_use_case.dart' as _i21;
import 'package:injectable/injectable.dart' as _i526;

class DataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i21.GetCatInfoByIdRepository>(() =>
        _i1058.GetCatInfoByIdRepositoryAdapter(
            gh<_i1058.GetCatInfoByIdApiSource>()));
    gh.factory<_i245.GetBreedsRepository>(
        () => _i164.GetBreedsRepositoryAdapter(gh<_i164.GetBreedsApiSource>()));
  }
}
