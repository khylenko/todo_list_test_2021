part of 'todo_bloc.dart';

abstract class TodoState
// extends Equatable
{
  TodoState();

  // @override
  // List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodosLoaded extends TodoState {
  final List<Todo> todos;

  TodosLoaded(this.todos);
  // @override
  // List<Object> get props => [todos];
}
