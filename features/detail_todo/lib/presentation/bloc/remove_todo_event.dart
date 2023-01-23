part of 'remove_todo_bloc.dart';

abstract class RemoveTodoEvent extends Equatable {
  const RemoveTodoEvent();

  @override
  List<Object> get props => [];
}

class RemoveEvent extends RemoveTodoEvent {
  final String id;

  const RemoveEvent(this.id);
  @override
  List<Object> get props => [id];
}
