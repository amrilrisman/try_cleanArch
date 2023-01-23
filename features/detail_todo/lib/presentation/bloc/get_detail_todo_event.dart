part of 'get_detail_todo_bloc.dart';

abstract class GetDetailTodoEvent extends Equatable {
  const GetDetailTodoEvent();

  @override
  List<Object> get props => [];
}

class OnGetDetailEvent extends GetDetailTodoEvent {
  final String id;

  const OnGetDetailEvent({required this.id});
  @override
  List<Object> get props => [id];
}
