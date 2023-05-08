import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/todo.dart';

class ListRepository {
  ListRepository() {
    SharedPreferences.getInstance().then((value) {
      sharedPreferences = value;
    });
  }

  late SharedPreferences sharedPreferences;

  Future<List<Todo>> getLists() async{
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonStirng = sharedPreferences.getString('lists') ?? '[]';
    final List jsonDecoded = json.decode(jsonStirng) as List; 
    return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
    }

  void saveList(List<Todo> lists) {
    final String jsonStirng = json.encode(lists);
    sharedPreferences.setString('lists', jsonStirng);
  }
}
