//import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController addTodoController = TextEditingController();
  final TextEditingController editTodoController = TextEditingController();
  final List todos = ['first', 'second', 'third'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return GestureDetector(onTap: () {},
            child: ListTile(
              leading: CircleAvatar(child: Text(' ${index + 1}')),
              trailing: PopupMenuButton(
                itemBuilder: (context) {
                  return ['edit', 'delete'].map((data) {
                    return PopupMenuItem(value: data, child: Text(data));
                  }).toList();
                },
                onSelected: (value) {
                  if (value == 'edit') {
                     return  showEditDialog(index);
                  }
                  if (value == 'delete') {
                     return deleteTodo(index);
                  }
                },
              ),
              title: Text(todo),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  // void addTodo() {
  //   showAddDialog();
  // }

void deleteTodo(int index){
  todos.removeAt(index);
  setState(() {
    
  });
}

  void showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add new Todo'),
          content: TextField(
            controller: addTodoController,
            decoration: const InputDecoration(hintText: 'Enter todo'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (addTodoController.text.trim().isNotEmpty) {
                  setState(() {
                    todos.add(addTodoController.text.trim());
                  });
                }
                addTodoController.clear();
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                addTodoController.clear();
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
  
  
  void showEditDialog(int index) {
    final task=todos[index];
    editTodoController.text=task;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add new Todo'),
          content: TextField(
            controller: editTodoController,
            decoration: const InputDecoration(hintText: 'update todo'),
          ),
          actions: [
            TextButton(
              onPressed: () {
              final updateTodo= editTodoController.text;
              todos[index]=updateTodo;
                // if (editTodoController.text.trim().isNotEmpty) {
                //   setState(() {
                //     todos.add(editTodoController.text.trim());
                //   });
                // }
                setState(() {
                  
                });
                editTodoController.clear();
                Navigator.pop(context);
              },
              child: const Text('Edit'),
            ),
            TextButton(
              onPressed: () {
                addTodoController.clear();
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
  
}
