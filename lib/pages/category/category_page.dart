// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../designs/colors.dart';
import '../../designs/images.dart';
import '../../designs/style.dart';
// import '../../designs/widgets/createDialog.dart';

import '../../models/category.dart';
import '../../models/model.dart';
import '../../models/todo.dart';
// import 'category_grid.dart';
import 'category_item.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final categoryList = Category.categoryList();

  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<ToDo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          widget.title,
          style: titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 22, top: 28, right: 22),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          children: [
            for (Category category in categoryList)
              CategoryItem(
                category: category,
              ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: const AddButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  void initState() {
    super.initState();
    _loadCategory();
  }

  Future<void> _loadCategory() async {
    todoList = await _databaseHelper.getToDos();

    setState(() {
      _updateCategoryCounters();
    });

    for (var category in categoryList) {
      print('1 category: ${category.name} counter ${category.counter}');
    }
  }

  void _updateCategoryCounters() {
    print('UPDATE #1');
    for (var category in categoryList) {
      category.counter = 0;
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
  const AddButton({super.key});

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
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return const CreateDialog(title: 'task');
            //   },
            // );
          },
          backgroundColor: primaryColor,
          child: addIcon,
        ),
      ),
    );
  }
}
