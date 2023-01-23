part of 'stats_todo_bloc.dart';

abstract class StatsTodoState extends Equatable {
  const StatsTodoState();

  @override
  List<Object> get props => [];
}

class StatsTodoInitial extends StatsTodoState {}

class StatsTodoLoading extends StatsTodoState {}

class StatsTodoSuccess extends StatsTodoState {
  final Map data;

  const StatsTodoSuccess(this.data);
}

class StatsTodoError extends StatsTodoState {
  final Map data;

  const StatsTodoError(this.data);
}
