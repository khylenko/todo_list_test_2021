part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final String value;

  AddTodo(this.value);
  @override
  List<Object> get props => [value];
}

class RemoveTodo extends TodoEvent {
  final int value;

  RemoveTodo(this.value);
  @override
  List<Object> get props => [value];
}
