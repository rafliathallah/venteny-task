import '../../data/repository/example_repository.dart';
import '../mapper/example_mapper.dart';
import '../models/post_dto.dart';
import '../../../../core/utils/typedef_util.dart';
import 'package:either_dart/either.dart';

class GetPostUseCase {
  final ExampleRepository repository;

  GetPostUseCase(this.repository);

  FutureOrError<List<PostDto>> execute() {
    return repository
        .getPosts()
        .mapRight((data) => data.map((e) => e.toDto()).toList());
  }
}
