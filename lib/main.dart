import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ok/models/todo.dart';

void main() async {
  runApp(Home());
}

class TodoRepository {
  Future<List<TodoItem>> getListOfTodoItem() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    var todoList = jsonDecode(response.body) as List<dynamic>;
    return todoList.map((e) => TodoItem.fromJson(e)).toList();
  }
}

class Home extends StatefulWidget {
  late List<TodoItem> _todoItems = List.empty();

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _loadTodoItems() async {
    var todoItems = await TodoRepository().getListOfTodoItem();
    setState(() {
      widget._todoItems = todoItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            LoadTodoItemsButton(
              loadTodoItems: _loadTodoItems,
            ),
            ...widget._todoItems
                .map((todo) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Todo(todoItem: todo),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}

typedef LoadTodoItems = int Function(int a, int b);

class Todo extends StatelessWidget {
  TodoItem todoItem;
  Todo({
    super.key,
    required this.todoItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: IconButton.outlined(
            onPressed: () {},
            icon: Icon(
                todoItem.isCompleted ? Icons.safety_check : Icons.numbers)),
        title: Text(
          '${todoItem.title}',
        ));
  }
}

class LoadTodoItemsButton extends StatelessWidget {
  void Function() loadTodoItems;

  LoadTodoItemsButton({super.key, required this.loadTodoItems});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: loadTodoItems, child: Text('Load Todo Items'));
  }
}
