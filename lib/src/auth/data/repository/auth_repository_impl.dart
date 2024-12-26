
import '../../../../core/data/remote/responses/base_response.dart';
import '../../../../core/utils/future_util.dart';
import '../../../../core/utils/typedef_util.dart';
import '../remote/request/auth_login_request.dart';
import '../remote/responses/auth_user_response.dart';
import '../remote/services/auth_service.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  FutureOrError<AuthUserResponse> login(
    AuthLoginRequest request,
  ) {
    return callOrError(() => _authService.login(request));
  }

}
