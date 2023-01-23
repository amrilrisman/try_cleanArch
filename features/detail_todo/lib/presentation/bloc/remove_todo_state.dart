part of 'remove_todo_bloc.dart';

abstract class RemoveTodoState extends Equatable {
  const RemoveTodoState();

  @override
  List<Object> get props => [];
}

class RemoveTodoInitial extends RemoveTodoState {}

class RemoveTodoLoading extends RemoveTodoState {}

class RemoveTodoSuccess extends RemoveTodoState {
  final bool value;

  const RemoveTodoSuccess(this.value);
}

class RemoveTodoError extends RemoveTodoState {
  final bool value;

  const RemoveTodoError(this.value);
}
