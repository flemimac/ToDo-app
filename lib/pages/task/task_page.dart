// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../../models/model.dart';

import '../../models/todo.dart';
import '../../pages/task/task_item.dart';

import '../../designs/images.dart';
import '../../designs/style.dart';
import '../../designs/colors.dart';
import '../../designs/widgets/createDialog.dart';

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
  final categoryList = Category.categoryList();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<ToDo> todoList = [];

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
      body: ListView(
        padding: const EdgeInsets.only(left: 28, top: 25, right: 28),
        children: [
          for (ToDo todo in todoList)
            TaskItem(
              todo: todo,
              onToDoChanged: _handleToDoChange,
              onDeleteItem: _deleteToDoItem,
            ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: AddButton(
        onCreate: _addToDoItem,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  void initState() {
    super.initState();
    _loadToDos();
  }

  Future<void> _loadToDos() async {
    todoList = await _databaseHelper.getToDos();

    if (widget.categoryFilter != null && widget.categoryFilter != 'All') {
      todoList = todoList
          .where((todo) => todo.todoCategory == widget.categoryFilter)
          .toList();
    }
    setState(() {});
  }

  void _handleToDoChange(ToDo todo) async {
    setState(() {
      todo.isDone = !todo.isDone;
    });
    await _databaseHelper.updateToDo(todo);
  }

  void _deleteToDoItem(String id) async {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
    await _databaseHelper.deleteToDo(id);
  }

  void _addToDoItem(
      String todoTask, String todoDesc, String todoCategory) async {
    final newTodo = ToDo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      todoTask: todoTask,
      todoDesc: todoDesc,
      todoCategory: todoCategory,
    );

    setState(() {
      todoList.add(newTodo);

      _updateCategoryCounters();
    });
    await _databaseHelper.insertToDo(newTodo);

    print('Добавлена задача: $newTodo');

    for (var category in categoryList) {
      print('2 category: ${category.name} counter ${category.counter}');
    }
  }

  void _updateCategoryCounters() {
    print('UPDATE #2');
    for (var category in categoryList) {
      category.counter = 0; // Сбрасываем счетчик
    }

    for (var todo in todoList) {
      for (var category in categoryList) {
        if (category.name == 'All') {
          category.counter++;
        }
        if (todo.todoCategory == category.name) {
          category.counter++;
        }
      }
    }
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
