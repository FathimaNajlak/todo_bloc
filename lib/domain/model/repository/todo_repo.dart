import 'package:todo_bloc/domain/model/todo.dart';

abstract class Todorepo {
  Future<List<Todo>> getTodos();

  Future<void> addTodo(Todo newTodo);

  Future<void> updateTodo(Todo todo);

  Future<void> deleteTodo(Todo todo);
}
