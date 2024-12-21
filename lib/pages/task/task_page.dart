import 'package:flutter/material.dart';

import '../../models/todo.dart';
import '../../pages/task/task_item.dart';

import '../../designs/images.dart';
import '../../designs/style.dart';
import '../../designs/colors.dart';
import '../../designs/widgets/createDialog.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final todoList = ToDo.todoList();

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
        title: const Text(
          'All',
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

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String todoTask, String todoDesc) {
    setState(() {
      todoList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoTask: todoTask,
        todoDesc: todoDesc,
      ));
    });
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
  final Function(String, String) onCreate;
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
            // ignore: avoid_print
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
