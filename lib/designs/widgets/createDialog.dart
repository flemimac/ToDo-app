import 'package:flutter/material.dart';

import '../../designs/colors.dart';
import '../../designs/style.dart';

class CreateDialog extends StatelessWidget {
  const CreateDialog({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        child: Dialog(
          backgroundColor: backgroundColor,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 20,
              children: [
                Text(
                  'Create new $title',
                  style: dialogHeadTextStyle,
                ),
                Column(
                  spacing: 15,
                  children: [
                    TextField(
                      maxLines: 1,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 3, color: primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 3, color: primaryColor),
                        ),
                        labelText: 'Input $title',
                      ),
                      style: dialogBodyTextStyle,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 3, color: primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 3, color: primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 3, color: primaryColor),
                        ),
                        labelText: 'Input description',
                      ),
                      style: dialogBodyTextStyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(10),
                      //   boxShadow: const [
                      //     BoxShadow(
                      //       color: Color.fromRGBO(0, 0, 0, 0.04),
                      //       offset: Offset(0, 2),
                      //       blurRadius: 2,
                      //     ),
                      //     BoxShadow(
                      //       color: Color.fromRGBO(0, 0, 0, 0.03),
                      //       offset: Offset(1, 4),
                      //       blurRadius: 3,
                      //     ),
                      //     BoxShadow(
                      //       color: Color.fromRGBO(0, 0, 0, 0.01),
                      //       offset: Offset(1, 5),
                      //       blurRadius: 5,
                      //     ),
                      //     BoxShadow(
                      //       color: Color.fromRGBO(0, 0, 0, 0.01),
                      //       offset: Offset(2, 5),
                      //       blurRadius: 5,
                      //     ),
                      //   ],
                      // ),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            backgroundColor: primaryColor),
                        child: const Text(
                          'Cancel',
                          style: buttonTextStyle,
                        ),
                      ),
                    ),
                    Container(
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(10),
                      //   boxShadow: const [
                      //     BoxShadow(
                      //       color: Color.fromRGBO(0, 0, 0, 0.04),
                      //       offset: Offset(0, 2),
                      //       blurRadius: 2,
                      //     ),
                      //     BoxShadow(
                      //       color: Color.fromRGBO(0, 0, 0, 0.03),
                      //       offset: Offset(1, 4),
                      //       blurRadius: 3,
                      //     ),
                      //     BoxShadow(
                      //       color: Color.fromRGBO(0, 0, 0, 0.01),
                      //       offset: Offset(1, 5),
                      //       blurRadius: 5,
                      //     ),
                      //     BoxShadow(
                      //       color: Color.fromRGBO(0, 0, 0, 0.01),
                      //       offset: Offset(2, 5),
                      //       blurRadius: 5,
                      //     ),
                      //   ],
                      // ),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            backgroundColor: primaryColor),
                        child: const Text(
                          'Create',
                          style: buttonTextStyle,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
