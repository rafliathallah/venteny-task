import '../data/remote/services/person_service.dart';
import '../data/repository/person_repository.dart';
import '../data/repository/person_repository_impl.dart';
import '../domain/usecases/person_usecase.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class PersonDimodule {
  @singleton
  PersonService personService(Dio dio) => PersonService(dio);

  @Singleton(as: PersonRepository)
  PersonRepositoryImpl get personRepository;

  @injectable
  PersonUseCase personUseCase(PersonRepository repository) =>
      PersonUseCase(repository);
}

