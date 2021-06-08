import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_list_test/data/models/todo.dart';
import 'package:to_do_list_test/data/repo/todo_repo.dart';
import 'package:to_do_list_test/utils/locator.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial());
  TodoRepo _todoRepo = locator.get<TodoRepo>();

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is LoadTodos) {
      _todoRepo.loadTodos();
      if (_todoRepo.todos.isNotEmpty) {
        yield TodosLoaded(_todoRepo.todos);
      }
    }
    if (event is AddTodo) {
      await _todoRepo.addTodo(event.value);
      yield TodosLoaded(_todoRepo.todos);
    }
    if (event is RemoveTodo) {
      await _todoRepo.removeTodo(event.value);
      if (_todoRepo.todos.isNotEmpty) {
        yield TodosLoaded(_todoRepo.todos);
      } else {
        yield TodoInitial();
      }
    }
  }
}
