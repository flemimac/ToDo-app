part of 'task_bloc.dart';

abstract class TaskEvent {}

class LoadTasksEvent extends TaskEvent {
  final String? categoryFilter;

  LoadTasksEvent({this.categoryFilter});
}

class UpdateTaskEvent extends TaskEvent {
  final ToDo todo;

  UpdateTaskEvent(this.todo);
}

class DeleteTaskEvent extends TaskEvent {
  final String id;

  DeleteTaskEvent(this.id);
}

class AddTaskEvent extends TaskEvent {
  final ToDo todo;

  AddTaskEvent(this.todo);
}
