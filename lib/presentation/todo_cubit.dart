import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/domain/model/repository/todo_repo.dart';
import 'package:todo_bloc/domain/model/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  final Todorepo todoRepo;

  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }
  Future<void> loadTodos() async {
    final todoList = await todoRepo.getTodos();
  }
}
