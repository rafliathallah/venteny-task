import 'package:bloc/bloc.dart';
import '../../../../core/data/local/entities/task_entity.dart';
import '../../../../core/utils/future_util.dart';
import '../../domain/models/task_dto.dart';
import '../../domain/usecases/task_usecase.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/data/local/entities/task_entity.dart';
import '../../../../core/data/local/entities/task_entity.dart';
import '../../../../core/domain/models/error_dto.dart';
part 'task_event.dart';
part 'task_state.dart';

// Generated CLI by Rafli Athallah
  // For business email: rafliathallah.business@gmail.com
@injectable
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  var stateData = const TaskStateData();
  final TaskUseCase taskUseCase;

  TaskBloc({required this.taskUseCase}) : super(const TaskInitialState()) {
    on<AddNewTaskEvent>(_addNewTask);
    on<FetchTaskEvent>(_fetchTasks);
    on<UpdateTaskEvent>(_updateTask);
    on<DeleteTaskEvent>(_deleteTask);
    on<SortTaskEvent>(_sortTasks);
    on<SearchTaskEvent>(_searchTasks);
  }
  _addNewTask(AddNewTaskEvent event, Emitter<TaskState>emit)async{
    emit(TaskLoadingState(stateData));
    var result = await taskUseCase.execute(event.taskDto);
    result.fold((error) {
      stateData = stateData.copyWith(error: error);
      emit(TaskFailedState(stateData));
    }, (right) {
      stateData = stateData.copyWith(message: 'Berhasil Membuat Task');
        emit(TaskSuccessPostState(stateData));
    },);
  }
  _updateTask(UpdateTaskEvent event, Emitter<TaskState>emit)async{
    emit(TaskLoadingState(stateData));
    var result = await taskUseCase.updateTaskById(
        event.taskDto.id,
        event.taskDto.title,
        event.taskDto.description,
        event.taskDto.startDate,
        event.taskDto.endDate,
        event.taskDto.status);
    print("Result $result");
    result.fold((error) {
      stateData = stateData.copyWith(error: error);
      emit(TaskFailedState(stateData));
    }, (right) {
      stateData = stateData.copyWith(message: 'Berhasil Memperbarui Task');
      if(event.completed){
       return add(FetchTaskEvent());
      }else{
      emit(TaskSuccessPostState(stateData));
      }
    },);
  }

  void _fetchTasks(FetchTaskEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoadingState(stateData));
    await Future.delayed(Duration(seconds: 2));
   var result =  await taskUseCase.getAllDataFromDb();
    result.fold((error) {
      stateData = stateData.copyWith(error: error);
      emit(TaskFailedState(stateData));
    }, (fromDb) {
      if(fromDb.isEmpty){
        stateData = stateData.copyWith(message: "Tidak ada Data Ditemukan");
        emit(TaskFailedState(stateData));
      }else{
        var task = fromDb.map((e) {
          return TaskDto(
            id: e.id,
            title: e.title??'',
            description: e.description??'',
            startDate: e.dateStart??'',
            endDate: e.dateEnd??'',
            status: e.status??''
          );
        },).toList();
       stateData = stateData.copyWith(taskDto: task);
       emit(TaskLoadedState(stateData));
      }

    },);
  }

  _deleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) async {
    var result = taskUseCase.deleteDataById(event.id);
    result.fold((error) {
      stateData = stateData.copyWith(error: error);
      emit(TaskFailedState(stateData));
    }, (right) {
      stateData = stateData.copyWith(message: 'Berhasil Menghapus Task');
      add(FetchTaskEvent());
    },);
  }

  _sortTasks(SortTaskEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoadingState(stateData));
    final result = await taskUseCase.getTaskByStatus(event.sortOption);
    result.fold((error) {
      stateData = stateData.copyWith(error: error);
      emit(TaskFailedState(stateData));
    }, (right) {
      var task = right.map((e) {
        return TaskDto(
            id: e.id,
            title: e.title??'',
            description: e.description??'',
            startDate: e.dateStart??'',
            endDate: e.dateEnd??'',
            status: e.status??''
        );
      },).toList();
      if(right.isEmpty){
        stateData = stateData.copyWith(message: "Tidak ada data ${event.sortOption}");
        emit(TaskFailedState(stateData));
      }else{
        stateData = stateData.copyWith(taskDto: task);
        emit(TaskLoadedState(stateData));
      }

    },);
  }
  _searchTasks(SearchTaskEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoadingState(stateData));
    try {
      final allTasksResult = await taskUseCase.getAllDataFromDb();
      allTasksResult.fold((error) {
        stateData = stateData.copyWith(error: error);
        emit(TaskFailedState(stateData));
      }, (allTasks) {
        final filteredTasks = allTasks.where((task) {
          return task.title!.toLowerCase()
              .contains(event.keywords.toLowerCase());
        }).toList();
        if (filteredTasks.isEmpty) {
          stateData = stateData.copyWith(message: "No tasks found matching your search.");
          emit(TaskFailedState(stateData));
        } else {
          final taskDtos = filteredTasks.map((task) {
            return TaskDto(
              id: task.id,
              title: task.title ?? '',
              description: task.description ?? '',
              startDate: task.dateStart ?? '',
              endDate: task.dateEnd ?? '',
              status: task.status ?? '',
            );
          }).toList();
          stateData = stateData.copyWith(taskDto: taskDtos);
          emit(TaskLoadedState(stateData));
        }
      });
    } catch (e) {
      stateData = stateData.copyWith(error: ErrorDto(message: e.toString()));
      emit(TaskFailedState(stateData));
    }
  }

}
