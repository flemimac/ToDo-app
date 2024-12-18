import 'package:flutter/material.dart';

import '../../designs/colors.dart';
import '../../designs/images.dart';
import '../../designs/style.dart';
import '../../designs/widgets/editDialog.dart';

import '../../models/todo.dart';

class TaskItem extends StatelessWidget {
  final ToDo todo;

  const TaskItem({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 15),
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
                Expanded(
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.todoTask!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: headTextStyle.copyWith(
                            decoration: todo.isDone
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      Text(
                        todo.todoDesc!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: bodyTextStyle.copyWith(
                            decoration: todo.isDone
                                ? TextDecoration.lineThrough
                                : null),
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const EditDialog(title: 'task');
                      },
                    );
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
