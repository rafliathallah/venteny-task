import '../../data/remote/responses/auth_user_response.dart';
import '../models/auth_user_dto.dart';

extension AuthUserExt on AuthUserResponse? {
  AuthUserDto toDto() {
    return AuthUserDto(
        id: '',
        name: 'Rafli',
       token: this?.token??'');
  }
}
