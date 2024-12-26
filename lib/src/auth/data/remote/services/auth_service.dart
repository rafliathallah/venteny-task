import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/data/remote/responses/base_response.dart';
import '../request/auth_login_request.dart';
import '../responses/auth_user_response.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) => _AuthService(dio);

  @POST('/api/login')
  Future<AuthUserResponse> login(
      @Body() AuthLoginRequest request);
}
