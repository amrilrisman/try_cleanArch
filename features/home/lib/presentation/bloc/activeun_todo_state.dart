part of 'activeun_todo_bloc.dart';

abstract class ActiveunTodoState extends Equatable {
  const ActiveunTodoState();

  @override
  List<Object> get props => [];
}

class ActiveunTodoInitial extends ActiveunTodoState {}

class ActiveunTodoLoading extends ActiveunTodoState {}

class ActiveunTodoSuccess extends ActiveunTodoState {}

class ActiveunTodoError extends ActiveunTodoState {}
