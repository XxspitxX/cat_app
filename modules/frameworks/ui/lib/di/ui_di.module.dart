//@GeneratedMicroModule;UiPackageModule;package:ui/di/ui_di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/get_breeds_use_case.dart' as _i245;
import 'package:domain/get_cat_info_by_id_use_case.dart' as _i21;
import 'package:injectable/injectable.dart' as _i526;
import 'package:ui/blocs/cat_details_bloc.dart' as _i179;
import 'package:ui/blocs/home_bloc.dart' as _i292;
import 'package:ui/blocs/splash_bloc.dart' as _i567;

class UiPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i567.SplashBloc>(() => _i567.SplashBloc());
    gh.factory<_i179.CatDetailsBloc>(() => _i179.CatDetailsBloc());
    gh.factory<_i292.HomeBloc>(() => _i292.HomeBloc(
          gh<_i245.GetBreedsUseCase>(),
          gh<_i21.GetCatInfoByIdUseCase>(),
        ));
  }
}
