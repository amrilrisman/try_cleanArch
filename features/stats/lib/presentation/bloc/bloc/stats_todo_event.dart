part of 'stats_todo_bloc.dart';

abstract class StatsTodoEvent extends Equatable {
  const StatsTodoEvent();

  @override
  List<Object> get props => [];
}

class OnStatsTodo extends StatsTodoEvent {}
