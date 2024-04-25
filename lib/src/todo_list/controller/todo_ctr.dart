import 'dart:developer';

import 'package:get/get.dart';

class Todo {
  String title;
  bool isCompleted;

  Todo({
    required this.title,
    this.isCompleted = false,
  });
}

class TodoCtr extends GetxController {
  final RxList<Todo> todos = <Todo>[].obs;

  void toggleCompleted(int index) {
    todos[index].isCompleted = !todos[index].isCompleted;
    log('message');
  }

  void addTodo(String title, {bool? isComplete}) {
    if (title.isNotEmpty) {
      todos.add(Todo(title: title));
    } else {
      log('empty title');
    }
  }

  void removeTodo(int index) {
    todos.removeAt(index);
  }
}
