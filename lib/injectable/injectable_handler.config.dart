// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:better_training_refactored/App/UI/Screens/Workout/Plans/changePlanFlow/change_plan_controller_cubit.dart'
    as _i3;
import 'package:better_training_refactored/App/UI/Screens/Workout/Plans/createPlanFlow/create_plan_controller_cubit.dart'
    as _i4;
import 'package:better_training_refactored/DB/database.dart' as _i5;
import 'package:better_training_refactored/injectable/injectable_handler.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ChangePlanControllerCubit>(
        () => _i3.ChangePlanControllerCubit(gh<int>()));
    gh.factory<_i4.CreatePlanControllerCubit>(
        () => _i4.CreatePlanControllerCubit());
    gh.lazySingleton<_i5.Database>(() => _i5.Database());
    gh.factory<_i6.Env>(
      () => _i6.EnvConfigDev(),
      registerFor: {_dev},
    );
    gh.factory<_i6.Env>(
      () => _i6.EnvConfigProd(),
      registerFor: {_prod},
    );
    return this;
  }
}
