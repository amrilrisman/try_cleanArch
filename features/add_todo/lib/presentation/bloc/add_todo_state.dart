part of 'add_todo_bloc.dart';

abstract class AddTodoState extends Equatable {
  const AddTodoState();

  @override
  List<Object> get props => [];
}

class AddTodoInitial extends AddTodoState {}

class AddTodoLoadingState extends AddTodoState {}

class OnAddTodoState extends AddTodoState {
  final String succes;

  const OnAddTodoState(this.succes);
  @override
  List<Object> get props => [succes];
}

class AddTodoErrorState extends AddTodoState {
  final String error;

  const AddTodoErrorState(this.error);
  @override
  List<Object> get props => [error];
}
