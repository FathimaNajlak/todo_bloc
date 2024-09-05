//ISAR TO DO MODEL
//Converts todo model into isar todo model where we can store our data in the isar db.

import 'package:isar/isar.dart';
import 'package:todo_bloc/domain/model/todo.dart';

//to generate isar todo object,run: dart run build_runner build
part 'isar_todo.g.dart';

@Collection()
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

//Convert isar objects ->pure todo object to use in our app
  Todo toDomain() {
    return Todo(id: id, text: text, isCompleted: isCompleted);
  }

//Convert pure todo object -> isar object tostore in isar db
  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }
}
