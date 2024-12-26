import '../remote/responses/post_response.dart';
import '../remote/services/example_service.dart';
import 'example_repository.dart';
import '../../../../core/utils/future_util.dart';
import '../../../../core/utils/typedef_util.dart';

class ExampleRepositoryImpl extends ExampleRepository {
  final ExampleService exampleService;

  ExampleRepositoryImpl(this.exampleService);

  @override
  FutureOrError<List<PostResponse>> getPosts() {
    return callOrError(() => exampleService.getPosts());
  }
}
