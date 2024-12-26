part of 'task_bloc.dart';

// Generated CLI by Rafli Athallah
  // For business email: rafliathallah.business@gmail.com
  
class TaskStateData extends Equatable {
  final List<TaskDto> taskDto;
  final String message;
  final ErrorDto? error;
  const TaskStateData({this.error,this.taskDto=const [],this.message=''});

  TaskStateData copyWith({
    List<TaskDto>?taskDto,
    String?message,
    ErrorDto? error}) {
    return TaskStateData(
      taskDto: taskDto?? this.taskDto,
      message: message??this.message,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [taskDto,error];
}

abstract class TaskState extends Equatable {
  final TaskStateData stateData;

  const TaskState(this.stateData);

  @override
  List<Object?> get props => [stateData];
}

class TaskInitialState extends TaskState {
  const TaskInitialState() : super(const TaskStateData());
}

class TaskLoadingState extends TaskState {
  const TaskLoadingState(super.stateData);
}

class TaskLoadedState extends TaskState {
  const TaskLoadedState(super.stateData);
}

class TaskSuccessPostState extends TaskState {
  const TaskSuccessPostState(super.stateData);
}
class TaskFailedState extends TaskState {
  const TaskFailedState(super.stateData);
}
