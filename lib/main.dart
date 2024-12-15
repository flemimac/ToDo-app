import 'package:flutter/material.dart';

import 'pages/mainTasks/mainTasks_page.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      home: MainTasksPage(title: 'Tasks'),
    );
  }
}
