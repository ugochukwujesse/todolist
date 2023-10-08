import 'package:flutter/material.dart';
import 'package:to_do_list/home_screen.dart';
import 'package:to_do_list/utility/app_colour.dart';
import 'package:to_do_list/utility/app_font_weight.dart';
import 'package:to_do_list/utility/app_text_size.dart';
void main() {
  runApp(const ToDoList());
}
class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}