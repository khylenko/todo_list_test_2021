import 'dart:math';

import 'package:hive/hive.dart';
import 'package:to_do_list_test/data/models/todo.dart';

class TodoRepo {
  List<Todo> todos = [];

  void loadTodos() {
    var todoBox = Hive.box('todos');
    todos = todoBox.values.toList().cast<Todo>();
  }

  Future<void> addTodo(String value) async {
    var todoBox = Hive.box('todos');
    int id = Random().nextInt(10000);
    await todoBox.add(Todo(id, value));
    loadTodos();
  }

  Future<void> removeTodo(int index) async {
    var todoBox = Hive.box('todos');
    await todoBox.deleteAt(index);
    loadTodos();
  }
}
