// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/model.dart';
import '../../models/todo.dart';

import '../../pages/task/task_item.dart';

import '../../designs/images.dart';
import '../../designs/style.dart';
import '../../designs/colors.dart';
import '../../designs/widgets/createDialog.dart';

import 'bloc/task_bloc.dart';

class TaskPage extends StatefulWidget {
  final String? title;
  final String? categoryFilter;

  const TaskPage({
    super.key,
    required this.title,
    this.categoryFilter,
  });

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late TaskBloc _taskBloc;
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _taskBloc = TaskBloc();
    _taskBloc.add(LoadTasksEvent(categoryFilter: widget.categoryFilter));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: arrowBackIcon,
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'Back',
            );
          },
        ),
        title: Text(
          widget.title!,
          style: titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        bloc: _taskBloc,
        builder: (context, state) {
          if (state is LoadingTasksState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedTasksState) {
            return ListView(
              padding: const EdgeInsets.only(left: 28, top: 25, right: 28),
              children: [
                for (ToDo todo in state.tasks)
                  TaskItem(
                    todo: todo,
                    onToDoChanged: _handleToDoChange,
                    onDeleteItem: (id) {
                      _taskBloc.add(DeleteTaskEvent(id));
                    },
                  ),
              ],
            );
          } else if (state is ErrorTasksState) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return Container();
        },
      ),
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: AddButton(
        onCreate: (todoTask, todoDesc, todoCategory) {
          final newTodo = ToDo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            todoTask: todoTask,
            todoDesc: todoDesc,
            todoCategory: todoCategory,
          );
          _taskBloc.add(AddTaskEvent(newTodo));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  void dispose() {
    _taskBloc.close();
    super.dispose();
  }

  void _handleToDoChange(ToDo todo) async {
    setState(() {
      todo.isDone = !todo.isDone;
    });
    await _databaseHelper.updateToDo(todo);
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: primaryColor,
      items: [
        BottomNavigationBarItem(
          icon: allIcon,
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: mineIcon,
          label: 'Mine',
        ),
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  final Function(String, String, String) onCreate;

  const AddButton({
    super.key,
    required this.onCreate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
      ),
      width: 70,
      height: 70,
      child: ClipOval(
        child: FloatingActionButton(
          onPressed: () {
            print('addButton');
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CreateDialog(
                  title: 'task',
                  onCreate: onCreate,
                );
              },
            );
          },
          backgroundColor: primaryColor,
          child: addIcon,
        ),
      ),
    );
  }
}
