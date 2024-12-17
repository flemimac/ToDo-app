import 'package:flutter/material.dart';

import '../../designs/images.dart';
import '../../designs/style.dart';
import '../../designs/colors.dart';
import '../../designs/widgets/createDialog.dart';

class AllTask extends StatelessWidget {
  const AllTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
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
        children: <Widget>[_task()],
      ),
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: const AddButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _task() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.06),
            offset: Offset(0, 1),
            blurRadius: 2,
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(1, 3),
            blurRadius: 3,
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.04),
            offset: Offset(1, 7),
            blurRadius: 5,
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.03),
            offset: Offset(2, 13),
            blurRadius: 5,
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.02),
            offset: Offset(4, 21),
            blurRadius: 6,
          ),
        ],
      ),
      child: Card(
        color: primaryColor,
        elevation: 0,
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: () {
            // ignore: avoid_print
            print('TaskCard');
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Task',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: headTextStyle,
                      ),
                      Text(
                        'Description',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: bodyTextStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: InkWell(
                    onTap: () {
                      // ignore: avoid_print
                      print('ChecIcon');
                    },
                    child: checkIcon,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // ignore: avoid_print
                    print('EditIcon');
                  },
                  child: editIcon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
    return ClipOval(
      child: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            // ignore: avoid_print
            print('addButton');
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const CreateDialog(title: 'task');
              },
            );
            // const CreateDialog(title: 'category');
          },
          backgroundColor: primaryColor,
          child: addIcon,
        ),
      ),
    );
  }
}
