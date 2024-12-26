import '../../../../core/data/remote/responses/base_response.dart';
import '../../../../core/utils/typedef_util.dart';
import '../remote/request/auth_login_request.dart';
import '../remote/responses/auth_user_response.dart';

abstract class AuthRepository {
  FutureOrError<AuthUserResponse> login(AuthLoginRequest request);

}
