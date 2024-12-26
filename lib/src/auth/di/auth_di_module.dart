import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../data/remote/services/auth_service.dart';
import '../data/repository/auth_repository.dart';
import '../data/repository/auth_repository_impl.dart';
import '../domain/usecases/auth_login_usecase.dart';

@module
abstract class AuthDiModule {
  @singleton
  AuthService authService(Dio dio) => AuthService(dio);

  @Singleton(as: AuthRepository)
  AuthRepositoryImpl get authRepository;

  @injectable
  AuthLoginUseCase authLoginUseCase(AuthRepository repository) =>
      AuthLoginUseCase(repository);
}
