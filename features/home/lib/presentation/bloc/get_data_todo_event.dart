part of 'get_data_todo_bloc.dart';

abstract class GetDataTodoEvent extends Equatable {
  const GetDataTodoEvent();

  @override
  List<Object> get props => [];
}

class OnGetDataTodoEvent extends GetDataTodoEvent {}
