import 'package:flutter_svg/flutter_svg.dart';

import '../../designs/images.dart';

class Category {
  String? id;
  String? name;
  SvgPicture? image;
  int counter;

  Category({
    required this.id,
    required this.name,
    required this.image,
    this.counter = 0,
  });

  static List<Category> categoryList() {
    return [
      Category(id: '01', name: 'All', image: allIcon),
      Category(id: '02', name: 'Travel', image: travelIcon),
      Category(id: '03', name: 'Study', image: studyIcon),
      Category(id: '04', name: 'Work', image: workIcon),
      Category(id: '04', name: 'Market', image: marketIcon),
    ];
  }
}
