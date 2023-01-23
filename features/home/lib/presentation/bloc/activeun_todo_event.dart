part of 'activeun_todo_bloc.dart';

abstract class ActiveunTodoEvent extends Equatable {
  const ActiveunTodoEvent();

  @override
  List<Object> get props => [];
}

class OnActiveEvent extends ActiveunTodoEvent {
  final TodoModels todo;

  const OnActiveEvent(this.todo);
  @override
  List<Object> get props => [todo];
}
