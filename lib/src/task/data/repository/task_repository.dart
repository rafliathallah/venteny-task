import '../../../../core/data/local/entities/task_entity.dart';

import '../../../../../core/data/remote/responses/base_response.dart';
import '../../../../core/utils/typedef_util.dart';
import '../remote/responses/task_response.dart';

// Generated CLI by Rafli Athallah
  // For business email: rafliathallah.business@gmail.com
  
abstract class TaskRepository {
//Uncomment if u has a service methode
  // FutureOrError<BaseResponse<TaskResponse>> getTask();
  FutureOrError<void>saveTask(TaskEntity task);
  FutureOrError<List<TaskEntity>> getAllTask();
  FutureOrError<void>updateTaskById(
      int id,
      String title,
      String description,
      String dateStart,
      String dateEnd,
      String status,
      );
  FutureOrError<void> deleteDataById(int id);
  FutureOrError<List<TaskEntity>> getTaskByStatus(String status);
  FutureOrError<List<TaskEntity>> getTasksByDateRange(String startDate, String endDate);
}
