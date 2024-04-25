import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_task/src/todo_list/controller/todo_ctr.dart';

class HomePageForTodoList extends StatefulWidget {
  const HomePageForTodoList({super.key});

  @override
  State<HomePageForTodoList> createState() => _HomePageForTodoListState();
}

class _HomePageForTodoListState extends State<HomePageForTodoList> {
  final ctr = Get.put(TodoCtr());
  final _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: Obx(
        () => ctr.todos.isEmpty
            ? const SizedBox.shrink()
            : ListView.builder(
                itemCount: ctr.todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Todo ${index + 1}'),
                    leading: IconButton(
                      onPressed: () {
                        ctr.removeTodo(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Todo'),
                content: TextField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Enter todo title',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      ctr.addTodo(_textEditingController.text);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
