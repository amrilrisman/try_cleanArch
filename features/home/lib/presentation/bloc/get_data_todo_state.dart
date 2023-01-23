part of 'get_data_todo_bloc.dart';

abstract class GetDataTodoState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDataTodoInitialState extends GetDataTodoState {}

class GetDataIsLoading extends GetDataTodoState {}

class GetDataErrorState extends GetDataTodoState {
  final String messageError;

  GetDataErrorState(this.messageError);
}

class GetDataHasData extends GetDataTodoState {
  final List<TodoModels> data;

  GetDataHasData(this.data);
}
