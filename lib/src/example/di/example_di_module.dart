import '../data/remote/services/example_service.dart';
import '../data/repository/example_repository.dart';
import '../data/repository/example_repository_impl.dart';
import '../domain/usecases/get_post_usecase.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ExampleDiModule {
  @singleton
  ExampleService exampleService(Dio dio) => ExampleService(dio);

  @Singleton(as: ExampleRepository)
  ExampleRepositoryImpl get exampleRepository;

  @injectable
  GetPostUseCase getPostUseCase(ExampleRepository repository) =>
      GetPostUseCase(repository);
}
