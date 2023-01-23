part of 'add_todo_bloc.dart';

abstract class AddTodoEvent extends Equatable {
  const AddTodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodo extends AddTodoEvent {
  final TodoEntity todo;

  const AddTodo(this.todo);
  @override
  List<Object> get props => [todo];
}
