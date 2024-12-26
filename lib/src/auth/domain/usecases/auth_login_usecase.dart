import 'package:either_dart/either.dart';

import '../../../../core/utils/typedef_util.dart';
import '../../data/remote/request/auth_login_request.dart';
import '../../data/repository/auth_repository.dart';
import '../../domain/mapper/auth_mapper.dart';
import '../models/auth_user_dto.dart';

class AuthLoginUseCase {
  final AuthRepository _repository;

  AuthLoginUseCase(this._repository);

  FutureOrError<AuthUserDto> execute(AuthLoginRequest request) {
    return _repository
        .login(request)
        .mapRight((response) => response.toDto());
  }
}
