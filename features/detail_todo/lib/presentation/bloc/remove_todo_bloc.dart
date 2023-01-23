import 'package:bloc/bloc.dart';
import 'package:detail_todo/detail_todo.dart';
import 'package:equatable/equatable.dart';

part 'remove_todo_event.dart';
part 'remove_todo_state.dart';

class RemoveTodoBloc extends Bloc<RemoveTodoEvent, RemoveTodoState> {
  final RemoveTodoUseCase removeTodo;
  RemoveTodoBloc(
    this.removeTodo,
  ) : super(RemoveTodoInitial()) {
    on<RemoveEvent>(_remove);
  }

  _remove(RemoveEvent event, Emitter<RemoveTodoState> emit) async {
    emit(RemoveTodoInitial());
    emit(RemoveTodoLoading());
    final result = await removeTodo.execute(id: event.id);

    result.fold(
      (failure) => emit(const RemoveTodoError(false)),
      (data) => emit(const RemoveTodoSuccess(true)),
    );
  }
}
