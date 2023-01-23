part of 'update_todo_bloc.dart';

abstract class UpdateTodoEvent extends Equatable {
  const UpdateTodoEvent();

  @override
  List<Object> get props => [];
}

class OnUpdateTodoEvent extends UpdateTodoEvent {
  final TodoModels todoModels;

  const OnUpdateTodoEvent(this.todoModels);
}
