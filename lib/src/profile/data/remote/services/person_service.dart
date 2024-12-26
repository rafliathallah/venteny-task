import '../../../../../core/data/remote/responses/base_response.dart';
import '../response/person_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'person_service.g.dart';

@RestApi()
abstract class PersonService {
  factory PersonService(Dio dio) => _PersonService(dio);

  @GET('/api/users/2')
  Future<PersonResponse> getPerson();
}
