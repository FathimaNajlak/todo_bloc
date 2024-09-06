//responsible for UI
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/domain/model/todo.dart';
import 'package:todo_bloc/presentation/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              todoCubit.addTodo(textController.text);
              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo'),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          child: const Icon(Icons.add),
          onPressed: () => _showAddTodoBox(context)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TodoCubit, List<Todo>>(builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return Padding(
                padding: const EdgeInsets.all(1.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: const Color.fromARGB(255, 204, 148, 214),
                  child: ListTile(
                    tileColor: const Color.fromARGB(255, 204, 148, 214),
                    title: Text(todo.text),
                    leading: Checkbox(
                      value: todo.isCompleted,
                      onChanged: (value) => todoCubit.toggleCompletion(todo),
                    ),
                    trailing: IconButton(
                        onPressed: () => todoCubit.deleteTodo(todo),
                        icon: const Icon(Icons.delete)),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
