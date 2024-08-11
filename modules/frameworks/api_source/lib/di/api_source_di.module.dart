//@GeneratedMicroModule;ApiSourcePackageModule;package:api_source/di/api_source_di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:api_source/base/api_source.dart' as _i323;
import 'package:api_source/get_breeds_api_source.dart' as _i1025;
import 'package:api_source/get_cat_info_by_id_api_source.dart' as _i407;
import 'package:data/get_breeds_repository.dart' as _i164;
import 'package:data/get_cat_info_by_id_repository.dart' as _i1058;
import 'package:dio/dio.dart' as _i361;
import 'package:injectable/injectable.dart' as _i526;

class ApiSourcePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i323.ApiSource>(() => _i323.ApiSource(gh<_i361.Dio>()));
    gh.factory<_i164.GetBreedsApiSource>(
        () => _i1025.GetBreedsApiSourceAdapter(gh<_i323.ApiSource>()));
    gh.factory<_i1058.GetCatInfoByIdApiSource>(
        () => _i407.GetCatInfoByIdApiSourceAdapter(gh<_i323.ApiSource>()));
  }
}
