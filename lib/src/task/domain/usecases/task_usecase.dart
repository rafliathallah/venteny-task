import '../../../../core/data/local/entities/task_entity.dart';
import '../../../../core/utils/typedef_util.dart';
import '../../data/repository/task_repository.dart';
import '../models/task_dto.dart';

// Generated CLI by Rafli Athallah
  // For business email: rafliathallah.business@gmail.com
  
class TaskUseCase {
  final TaskRepository repository;

  TaskUseCase(this.repository);

  FutureOrError execute(TaskDto request){
    return repository.saveTask(toEntity(request));
  }
  FutureOrError<List<TaskEntity>> getAllDataFromDb() {
    return repository.getAllTask();
  }
  FutureOrError<void>updateTaskById( int id,
      String title,
      String description,
      String dateStart,
      String dateEnd,
      String status,){
    return repository.updateTaskById(id, title, description, dateStart, dateEnd, status);
  }
  FutureOrError<void> deleteDataById(int id) {
    return repository.deleteDataById(id);
  }
  FutureOrError<List<TaskEntity>> getTaskByStatus(String status) {
    return repository.getTaskByStatus(status);
  }

  TaskEntity toEntity(TaskDto req){
    return TaskEntity(
        id:req.id,
        title: req.title,
        description: req.description,
        dateStart: req.startDate,
        dateEnd: req.endDate,
        status: req.status
    );
  }
  // Uncomment this UseCase if u ready response from Backend
  // FutureOrError<TaskDto> execute() {
  //   return repository.getTask().mapRight((res) {
  //     // Map response to DTO here
  //     return res.result.toDto();
  //   });
  // }
}
