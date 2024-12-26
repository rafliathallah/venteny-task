import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../data/remote/services/task_service.dart';
import '../data/repository/task_repository.dart';
import '../data/repository/task_repository_impl.dart';
import '../domain/usecases/task_usecase.dart';

// Generated CLI by Rafli Athallah
  // For business email: rafliathallah.business@gmail.com

@module
abstract class TaskDiModule {
  @singleton
  TaskService taskService(Dio dio) => TaskService(dio);

  @Singleton(as: TaskRepository)
  TaskRepositoryImpl get taskRepository;

  @injectable
  TaskUseCase taskUseCase(TaskRepository repository) => TaskUseCase(repository);
}
