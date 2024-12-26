import '../../data/remote/response/person_response.dart';
import '../models/person_dto.dart';

extension PersonExt on PersonResponse? {
  PersonDto toDto() {
    return PersonDto(
        id: this?.data?.id ?? 0,
        email: this?.data?.email ?? '',
        frisName: this?.data?.firstName ?? '',
        lastName: this?.data?.lastName ?? '',
        avatar: this?.data?.avatar ?? '');
  }
}
