part of 'task_bloc.dart';

abstract class TaskState {}

class LoadingTasksState extends TaskState {}

class LoadedTasksState extends TaskState {
  final List<ToDo> tasks;

  LoadedTasksState(this.tasks);
}

class ErrorTasksState extends TaskState {
  final String error;

  ErrorTasksState(this.error);
}
