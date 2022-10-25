import 'package:flutter/material.dart';
import 'package:todoapp/data/model/todo.dart';
import 'package:todoapp/databasehelper.dart';

class DbProvider extends ChangeNotifier{
  List<Todo> _arrToDo = [];
  List<Todo> get todos => _arrToDo;
  late DatabaseHelper _dbHelper;

  DbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllTodos();
  }

  void _getAllTodos() async {
    _arrToDo = await _dbHelper.getTodos();
    notifyListeners();
  }

  Future<void> addTodo(Todo todo) async {
    await _dbHelper.insertTodo(todo);
    _getAllTodos();
  }
}