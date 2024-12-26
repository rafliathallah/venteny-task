part of 'task_bloc.dart';

// Generated CLI by Rafli Athallah
  // For business email: rafliathallah.business@gmail.com
  
sealed class TaskEvent extends Equatable {
  const TaskEvent();

}
class AddNewTaskEvent extends TaskEvent {
  final TaskDto taskDto;

  const AddNewTaskEvent({required this.taskDto});

  @override
  List<Object?> get props => [];
}

class FetchTaskEvent extends TaskEvent {
  @override
  List<Object?> get props => [];
}

class SortTaskEvent extends TaskEvent {
  final String sortOption;

  const SortTaskEvent({required this.sortOption});
  @override
  List<Object?> get props => [];
}

class UpdateTaskEvent extends TaskEvent {
  final TaskDto taskDto;
  final bool completed;

  const UpdateTaskEvent({required this.taskDto,this.completed=false});
  @override
  List<Object?> get props => [];
}

class DeleteTaskEvent extends TaskEvent {
  final int id;

  const DeleteTaskEvent({required this.id});
  @override
  List<Object?> get props => [];
}

class SearchTaskEvent extends TaskEvent{
  final String keywords;

  const SearchTaskEvent({required this.keywords});
  @override
  List<Object?> get props => [];
}

