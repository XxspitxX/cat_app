//@GeneratedMicroModule;DomainPackageModule;package:domain/di/domain_di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/get_breeds_use_case.dart' as _i245;
import 'package:domain/get_cat_info_by_id_use_case.dart' as _i21;
import 'package:injectable/injectable.dart' as _i526;

class DomainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i245.GetBreedsUseCase>(
        () => _i245.GetBreedsUseCaseAdapter(gh<_i245.GetBreedsRepository>()));
    gh.factory<_i21.GetCatInfoByIdUseCase>(() =>
        _i21.GetCatInfoByIdUseCaseAdapter(gh<_i21.GetCatInfoByIdRepository>()));
  }
}
