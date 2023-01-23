part of 'update_todo_bloc.dart';

abstract class UpdateTodoState extends Equatable {
  const UpdateTodoState();

  @override
  List<Object> get props => [];
}

class UpdateTodoInitial extends UpdateTodoState {}

class UpdateLoadingState extends UpdateTodoState {}

class UpdateSuccessState extends UpdateTodoState {
  final bool isAdd;

  const UpdateSuccessState(this.isAdd);
}

class UpdateErrorState extends UpdateTodoState {}
