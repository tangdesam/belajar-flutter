
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/dbprovider.dart';
import 'package:todoapp/ui/todoadd_updatepage.dart';

class ToDoListPage extends StatelessWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Consumer<DbProvider>(
        builder: (context, provider, child) {
          final arrToDo = provider.todos;
          return ListView.builder(
            itemCount: arrToDo.length,
            itemBuilder: (context, index) {
              final todo = arrToDo[index];
              return Dismissible(
                key: Key(todo.id.toString()),
                background: Container(color: Colors.red,),
                onDismissed: (direction) {

                },
                child: Card(
                  child: ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.detail),
                    onTap: () async {

                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ToDoAddUpdatePage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
