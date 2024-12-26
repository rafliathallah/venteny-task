import '../../../../core/utils/typedef_util.dart';
import '../remote/response/person_response.dart';



abstract class PersonRepository {
  FutureOrError<PersonResponse> getPerson();
}
