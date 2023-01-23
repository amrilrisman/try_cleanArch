part of 'get_detail_todo_bloc.dart';

abstract class GetDetailTodoState extends Equatable {
  const GetDetailTodoState();

  @override
  List<Object> get props => [];
}

class GetDetailTodoInitial extends GetDetailTodoState {}

class GetDetailTodoLoadingState extends GetDetailTodoState {}

class GetDetailTodoHasDataState extends GetDetailTodoState {
  final TodoModels todo;

  const GetDetailTodoHasDataState({required this.todo});
}

class GetDetailErrorState extends GetDetailTodoState {}