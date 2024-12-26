import '../../../../core/utils/typedef_util.dart';
import '../remote/responses/post_response.dart';

abstract class ExampleRepository {
  FutureOrError<List<PostResponse>> getPosts();
}
