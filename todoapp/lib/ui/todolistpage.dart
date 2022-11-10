
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/common/navigation.dart';
import 'package:todoapp/provider/dbprovider.dart';
import 'package:todoapp/ui/todoadd_updatepage.dart';

class ToDoListPage extends StatelessWidget {
  static const routeName = '/todo_list';
  final _firestore = FirebaseFirestore.instance;
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
                  provider.deleteTodo(todo.id!);
                },
                child: Card(
                  child: ListTile(
                    title: Text(todo.id.toString() + ' | ' + todo.title),
                    subtitle: Text(todo.detail),
                    trailing: ElevatedButton(
                      onPressed: () {
                        _firestore.collection('todo').add(
                          {
                            'id': todo.id,
                            'title': todo.title,
                            'detail': todo.detail,
                            'dateCreated': Timestamp.now(),
                          }
                        );
                      },
                      child: Text('done'),
                    ),
                    onTap: () async {
                      final navigator = Navigator.of(context);
                      // TODO kenapa kok pake tanda seru todo.id!
                      final selectedTodo = await provider.getTodoById(todo.id!);
                      // navigator.push(MaterialPageRoute(builder: (context) {
                      //   return ToDoAddUpdatePage(todo: selectedTodo,);
                      // }));
                      
                      Navigation.intentWithData(ToDoAddUpdatePage.routeName, selectedTodo);
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
