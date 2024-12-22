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
      Category(id: '01', name: 'All', image: allIcon, counter: 0),
      Category(id: '02', name: 'Travel', image: travelIcon, counter: 0),
      Category(id: '03', name: 'Study', image: studyIcon, counter: 0),
      Category(id: '04', name: 'Work', image: workIcon, counter: 0),
      Category(id: '04', name: 'Market', image: marketIcon, counter: 0),
    ];
  }
}
