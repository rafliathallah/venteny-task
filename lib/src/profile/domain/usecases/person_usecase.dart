import '../../../../core/utils/typedef_util.dart';
import '../../data/repository/person_repository.dart';
import '../mapper/person_mapper.dart';
import '../models/person_dto.dart';
import 'package:either_dart/either.dart';

class PersonUseCase {
  final PersonRepository repository;

  PersonUseCase(this.repository);

  FutureOrError<PersonDto> execute() {
    return repository.getPerson().mapRight((res) => res.toDto());
  }
}
