import '../../../../core/data/local/dao/task_dao.dart';
import '../../../../core/data/local/entities/task_entity.dart';

import '../../../../../core/data/remote/responses/base_response.dart';
import '../../../../core/utils/future_util.dart';
import '../../../../core/utils/typedef_util.dart';
import '../remote/responses/task_response.dart';
import '../remote/services/task_service.dart';
import 'task_repository.dart';

// Generated CLI by Rafli Athallah
  // For business email: rafliathallah.business@gmail.com
  
class TaskRepositoryImpl implements TaskRepository {
  final TaskService _taskService;
  final TaskDao _taskDao;

  TaskRepositoryImpl(this._taskService,this._taskDao);

  @override
  FutureOrError<List<TaskEntity>> getAllTask() {
   return callOrError(() => _taskDao.getAllTask(),);
  }

  @override
  FutureOrError<void> saveTask(TaskEntity task) {
    return callOrError(() => _taskDao.insertTask(task),);
  }

  @override
  FutureOrError<void> deleteDataById(int id) {
    return callOrError(() => _taskDao.deleteDataById(id),);
  }

  @override
  FutureOrError<void> updateTaskById(int id, String title, String description, String dateStart, String dateEnd, String status) {
    return callOrError(() => _taskDao.updateTaskById(id, title, description, dateStart, dateEnd, status),);
  }

  @override
  FutureOrError<List<TaskEntity>> getTaskByStatus(String status) {
    return callOrError(() => _taskDao.getTasksByStatus(status),);
  }

  @override
  FutureOrError<List<TaskEntity>> getTasksByDateRange(String startDate, String endDate) {
    return callOrError(() => _taskDao.getTasksByDateRange(startDate, endDate),);
  }
  //Uncomment if u has a service methode
  // @override
  // FutureOrError<BaseResponse<TaskResponse>> getTask() {
  //   return callOrError(() => _taskService.getTask());
  // }
}
