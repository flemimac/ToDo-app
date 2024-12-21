import 'package:flutter/material.dart';

import '../../pages/category/category_item.dart';
import '../../models/category.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  final categoryList = Category.categoryList();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
