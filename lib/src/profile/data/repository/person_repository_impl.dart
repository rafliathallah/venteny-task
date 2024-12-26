import '../../../../core/utils/future_util.dart';
import '../../../../core/utils/typedef_util.dart';
import '../remote/response/person_response.dart';
import 'person_repository.dart';

import '../remote/services/person_service.dart';

class PersonRepositoryImpl extends PersonRepository {
  final PersonService personService;

  PersonRepositoryImpl(this.personService);

  @override
  FutureOrError<PersonResponse> getPerson() {
    return callOrError(() => personService.getPerson());
  }
}
