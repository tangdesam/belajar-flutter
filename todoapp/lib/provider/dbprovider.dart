import 'package:flutter/material.dart';
import 'package:todoapp/data/model/todo.dart';
import 'package:todoapp/utils/databasehelper.dart';

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

  Future<Todo> getTodoById(int id) async {
    return await _dbHelper.getTodoById(id);
  }

  Future<Todo> getOldestTodo() async {
    return await _dbHelper.getOldestTodo();
  }

  Future<void> updateTodo(Todo todo) async {
    // TODO cari tau beda nya pake Future dan tanpa Future
    // bisa tanpa Future
    await _dbHelper.updateTodo(todo);
    _getAllTodos();
  }

  Future<void> deleteTodo(int id) async {
    await _dbHelper.deleteTodo(id);
    _getAllTodos();
  }

}