import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/todo.dart';
import '../../../models/model.dart';

part 'task_state.dart';
part 'task_event.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<ToDo> todoList = [];

  TaskBloc() : super(LoadingTasksState()) {
    on<LoadTasksEvent>((event, emit) async {
      emit(LoadingTasksState());

      try {
        todoList = await _databaseHelper.getToDos();

        if (event.categoryFilter != null && event.categoryFilter != 'All') {
          todoList = todoList
              .where((todo) => todo.todoCategory == event.categoryFilter)
              .toList();
        }

        emit(LoadedTasksState(todoList));
      } on Exception catch (e) {
        emit(ErrorTasksState(e.toString()));
      }
    });

    on<UpdateTaskEvent>((event, emit) async {
      await _databaseHelper.updateToDo(event.todo);
      add(LoadTasksEvent(categoryFilter: event.todo.todoCategory));
    });

    on<DeleteTaskEvent>((event, emit) async {
      await _databaseHelper.deleteToDo(event.id);
      add(LoadTasksEvent());
    });

    on<AddTaskEvent>((event, emit) async {
      await _databaseHelper.insertToDo(event.todo);
      add(LoadTasksEvent());
    });
  }
}
