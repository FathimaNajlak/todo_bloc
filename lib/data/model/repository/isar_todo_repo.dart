import 'package:isar/isar.dart';
import 'package:todo_bloc/data/model/isar_todo.dart';
import 'package:todo_bloc/domain/model/repository/todo_repo.dart';
import 'package:todo_bloc/domain/model/todo.dart';

class IsarTodoRepo implements Todorepo {
  final Isar db;
  IsarTodoRepo(this.db);

//get todos
  @override
  Future<List<Todo>> getTodos() async {
    //fetch from db
    final todos = await db.todoIsars.where().findAll();

    //return as a list of todos and return to domain layer
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  //add todo
  @override
  Future<void> addTodo(Todo newTodo) {
    //convert todo into isar todo
    final todoIsar = TodoIsar.fromDomain(newTodo);

    //so that we can store it in our db
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  //update todo
  @override
  Future<void> updateTodo(Todo todo) {
    //convert todo into isar todo
    final todoIsar = TodoIsar.fromDomain(todo);

    //so that we can store it in our db
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  //delete todo
  @override
  Future<void> deleteTodo(Todo todo) async {
    await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }
}
