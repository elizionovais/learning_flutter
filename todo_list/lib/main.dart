import 'package:flutter/material.dart';
import 'package:todo_list/pages/todo_list_home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey,
      ),
      title: 'Todo List',
      home: const TodoListHomePage(),
    );
  }
}
