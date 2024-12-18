import 'package:flutter/material.dart';

import '../../designs/colors.dart';
import '../../designs/images.dart';
import '../../designs/style.dart';
import '../task/task_page.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AllTask()),
            );
          },
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
                  style: headTextStyle,
                ),
                const Text(
                  '+99 tasks',
                  style: bodyTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
