  
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../../../core/data/remote/responses/base_response.dart';
import '../responses/task_response.dart';
part 'task_service.g.dart';

// Generated CLI by Rafli Athallah
  // For business email: rafliathallah.business@gmail.com

@RestApi()
abstract class TaskService {
  factory TaskService(Dio dio) => _TaskService(dio);

  //Uncomment if ready response and Api from backend//
  // @GET('/task')
  // Future<BaseResponse<TaskResponse>> getTask();
}
