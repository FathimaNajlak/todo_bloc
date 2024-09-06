// this page is responsible for providing cubit to the view(UI)
//to do that we need to use BlocProvider
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/domain/model/repository/todo_repo.dart';
import 'package:todo_bloc/presentation/todo_cubit.dart';
import 'package:todo_bloc/presentation/todo_view.dart';

class TodoPage extends StatelessWidget {
  final Todorepo todoRepo;
  const TodoPage({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepo),
      child: const TodoView(),
    );
  }
}
