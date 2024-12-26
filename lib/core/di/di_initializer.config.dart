// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_clean_architecture/core/data/local/app_database.dart'
    as _i700;
import 'package:bloc_clean_architecture/core/data/local/app_preferences.dart'
    as _i1041;
import 'package:bloc_clean_architecture/core/data/local/dao/task_dao.dart'
    as _i816;
import 'package:bloc_clean_architecture/core/data/local/database_migration.dart'
    as _i116;
import 'package:bloc_clean_architecture/core/data/remote/interceptors/auth_interceptor.dart'
    as _i613;
import 'package:bloc_clean_architecture/core/di/di_app_module.dart' as _i182;
import 'package:bloc_clean_architecture/core/di/local_module.dart' as _i884;
import 'package:bloc_clean_architecture/core/di/network_module.dart' as _i348;
import 'package:bloc_clean_architecture/core/utils/connectivity_utils/connectivity_bloc.dart'
    as _i383;
import 'package:bloc_clean_architecture/core/utils/theme_utils.dart' as _i23;
import 'package:bloc_clean_architecture/navigation/navigator.dart' as _i318;
import 'package:bloc_clean_architecture/navigation/router/router.dart' as _i791;
import 'package:bloc_clean_architecture/src/auth/data/remote/services/auth_service.dart'
    as _i572;
import 'package:bloc_clean_architecture/src/auth/data/repository/auth_repository.dart'
    as _i119;
import 'package:bloc_clean_architecture/src/auth/data/repository/auth_repository_impl.dart'
    as _i71;
import 'package:bloc_clean_architecture/src/auth/di/auth_di_module.dart'
    as _i320;
import 'package:bloc_clean_architecture/src/auth/domain/usecases/auth_login_usecase.dart'
    as _i33;
import 'package:bloc_clean_architecture/src/auth/presentation/auth_login_bloc.dart'
    as _i513;
import 'package:bloc_clean_architecture/src/example/data/remote/services/example_service.dart'
    as _i247;
import 'package:bloc_clean_architecture/src/example/data/repository/example_repository.dart'
    as _i514;
import 'package:bloc_clean_architecture/src/example/data/repository/example_repository_impl.dart'
    as _i231;
import 'package:bloc_clean_architecture/src/example/di/example_di_module.dart'
    as _i325;
import 'package:bloc_clean_architecture/src/example/domain/usecases/get_post_usecase.dart'
    as _i989;
import 'package:bloc_clean_architecture/src/example/presentation/example/example_bloc.dart'
    as _i855;
import 'package:bloc_clean_architecture/src/profile/data/remote/services/person_service.dart'
    as _i758;
import 'package:bloc_clean_architecture/src/profile/data/repository/person_repository.dart'
    as _i302;
import 'package:bloc_clean_architecture/src/profile/data/repository/person_repository_impl.dart'
    as _i198;
import 'package:bloc_clean_architecture/src/profile/di/person_di_module.dart'
    as _i70;
import 'package:bloc_clean_architecture/src/profile/domain/usecases/person_usecase.dart'
    as _i869;
import 'package:bloc_clean_architecture/src/profile/persentation/person_bloc.dart'
    as _i279;
import 'package:bloc_clean_architecture/src/task/data/remote/services/task_service.dart'
    as _i415;
import 'package:bloc_clean_architecture/src/task/data/repository/task_repository.dart'
    as _i994;
import 'package:bloc_clean_architecture/src/task/data/repository/task_repository_impl.dart'
    as _i661;
import 'package:bloc_clean_architecture/src/task/di/task_di_module.dart'
    as _i914;
import 'package:bloc_clean_architecture/src/task/domain/usecases/task_usecase.dart'
    as _i715;
import 'package:bloc_clean_architecture/src/task/presentation/bloc/task_bloc.dart'
    as _i99;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/cupertino.dart' as _i719;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _dev = 'dev';
const String _test = 'test';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final localModule = _$LocalModule();
    final networkModule = _$NetworkModule();
    final dIAppModule = _$DIAppModule();
    final authDiModule = _$AuthDiModule(this);
    final exampleDiModule = _$ExampleDiModule(this);
    final personDimodule = _$PersonDimodule(this);
    final taskDiModule = _$TaskDiModule(this);
    await gh.factoryAsync<_i700.AppDatabase>(
      () => localModule.appDatabase(),
      preResolve: true,
    );
    gh.factory<_i23.ThemeCubit>(() => _i23.ThemeCubit());
    gh.factory<_i383.ConnectivityBloc>(() => _i383.ConnectivityBloc());
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => localModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i116.DatabaseMigration>(() => localModule.dbMigration);
    gh.singleton<_i613.AuthInterceptor>(() => networkModule.authInterceptor);
    gh.lazySingleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => dIAppModule.key);
    gh.singleton<_i1041.AppPreferences>(
        () => localModule.appPreferences(gh<_i460.SharedPreferences>()));
    gh.factory<String>(
      () => networkModule.baseUrl,
      instanceName: 'base_url',
      registerFor: {_dev},
    );
    gh.singleton<_i361.Dio>(() => networkModule.dio(
          gh<String>(instanceName: 'base_url'),
          gh<_i613.AuthInterceptor>(),
        ));
    gh.factory<String>(
      () => networkModule.testBaseUrl,
      instanceName: 'base_url',
      registerFor: {_test},
    );
    gh.singleton<_i816.TaskDao>(
        () => localModule.taskDao(gh<_i700.AppDatabase>()));
    gh.lazySingleton<_i791.AppRouter>(
        () => _i791.AppRouter(gh<_i719.GlobalKey<_i719.NavigatorState>>()));
    gh.factory<String>(
      () => networkModule.prodBaseUrl,
      instanceName: 'base_url',
      registerFor: {_prod},
    );
    gh.singleton<_i572.AuthService>(
        () => authDiModule.authService(gh<_i361.Dio>()));
    gh.singleton<_i247.ExampleService>(
        () => exampleDiModule.exampleService(gh<_i361.Dio>()));
    gh.singleton<_i758.PersonService>(
        () => personDimodule.personService(gh<_i361.Dio>()));
    gh.singleton<_i415.TaskService>(
        () => taskDiModule.taskService(gh<_i361.Dio>()));
    gh.singleton<_i119.AuthRepository>(() => authDiModule.authRepository);
    gh.factory<_i33.AuthLoginUseCase>(
        () => authDiModule.authLoginUseCase(gh<_i119.AuthRepository>()));
    gh.factory<_i318.BaseNavigator>(
        () => _i318.BaseNavigator(gh<_i791.AppRouter>()));
    gh.singleton<_i514.ExampleRepository>(
        () => exampleDiModule.exampleRepository);
    gh.singleton<_i994.TaskRepository>(() => taskDiModule.taskRepository);
    gh.factory<_i513.AuthLoginBloc>(() => _i513.AuthLoginBloc(
          authLoginUseCase: gh<_i33.AuthLoginUseCase>(),
          preferences: gh<_i1041.AppPreferences>(),
        ));
    gh.factory<_i715.TaskUseCase>(
        () => taskDiModule.taskUseCase(gh<_i994.TaskRepository>()));
    gh.singleton<_i302.PersonRepository>(() => personDimodule.personRepository);
    gh.factory<_i869.PersonUseCase>(
        () => personDimodule.personUseCase(gh<_i302.PersonRepository>()));
    gh.factory<_i99.TaskBloc>(
        () => _i99.TaskBloc(taskUseCase: gh<_i715.TaskUseCase>()));
    gh.factory<_i989.GetPostUseCase>(
        () => exampleDiModule.getPostUseCase(gh<_i514.ExampleRepository>()));
    gh.factory<_i279.PersonBloc>(
        () => _i279.PersonBloc(personUseCase: gh<_i869.PersonUseCase>()));
    gh.factory<_i855.ExampleBloc>(
        () => _i855.ExampleBloc(getPostUseCase: gh<_i989.GetPostUseCase>()));
    return this;
  }
}

class _$LocalModule extends _i884.LocalModule {}

class _$NetworkModule extends _i348.NetworkModule {}

class _$DIAppModule extends _i182.DIAppModule {}

class _$AuthDiModule extends _i320.AuthDiModule {
  _$AuthDiModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i71.AuthRepositoryImpl get authRepository =>
      _i71.AuthRepositoryImpl(_getIt<_i572.AuthService>());
}

class _$ExampleDiModule extends _i325.ExampleDiModule {
  _$ExampleDiModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i231.ExampleRepositoryImpl get exampleRepository =>
      _i231.ExampleRepositoryImpl(_getIt<_i247.ExampleService>());
}

class _$PersonDimodule extends _i70.PersonDimodule {
  _$PersonDimodule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i198.PersonRepositoryImpl get personRepository =>
      _i198.PersonRepositoryImpl(_getIt<_i758.PersonService>());
}

class _$TaskDiModule extends _i914.TaskDiModule {
  _$TaskDiModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i661.TaskRepositoryImpl get taskRepository => _i661.TaskRepositoryImpl(
        _getIt<_i415.TaskService>(),
        _getIt<_i816.TaskDao>(),
      );
}
