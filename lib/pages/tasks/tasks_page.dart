import 'package:flutter/material.dart';

import '../../designs/colors.dart';
import '../../designs/images.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Tasks',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'SFPro-Bold',
          ),
        ),
        centerTitle: true,
      ),
      body: const GridItem(),
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: const AddButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class GridItem extends StatefulWidget {
  const GridItem({super.key});

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, top: 28, right: 22),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: <Widget>[
          _category(),
          _category(),
          _category(),
          _category(),
          _category(),
          _category(),
          _category(),
          _category(),
        ],
      ),
    );
  }

  Widget _category() {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              offset: const Offset(0, 1),
              blurRadius: 2,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(1, 3),
              blurRadius: 3,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: const Offset(1, 7),
              blurRadius: 5,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: const Offset(2, 13),
              blurRadius: 5,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              offset: const Offset(4, 21),
              blurRadius: 6,
            ),
          ],
        ),
        child: Card(
          color: primaryColor,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: allIcon,
                ),
                const Text(
                  'All',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'SFPro-Regular',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: headColor,
                  ),
                ),
                const Text(
                  '+99 tasks',
                  style: TextStyle(
                    fontFamily: 'SFPro-Regular',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: bodyColor,
                  ),
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
          onPressed: () {},
          backgroundColor: primaryColor,
          child: addIcon,
        ),
      ),
    );
  }
}
