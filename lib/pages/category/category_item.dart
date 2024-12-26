import 'package:flutter/material.dart';

import '../../designs/colors.dart';
import '../../designs/style.dart';

import '../../models/category.dart';

import '../task/task_page.dart';

class CategoryItem extends StatefulWidget {
  final Category category;

  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
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
              MaterialPageRoute(
                builder: (context) => TaskPage(
                  title: widget.category.name,
                  categoryFilter: widget.category.name,
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: widget.category.image!,
                ),
                Text(
                  widget.category.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: headTextStyle,
                ),
                Text(
                  "${widget.category.counter} tasks",
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
