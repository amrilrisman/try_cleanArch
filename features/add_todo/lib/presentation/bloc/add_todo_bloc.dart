import 'package:add_todo/domain/use_case/add_todo_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:core/domain/entity/todo_entity.dart';
import 'package:equatable/equatable.dart';

part 'add_todo_event.dart';
part 'add_todo_state.dart';

class AddTodoBloc extends Bloc<AddTodoEvent, AddTodoState> {
  final AddTodoUseCase addtodocase;
  AddTodoBloc(
    this.addtodocase,
  ) : super(AddTodoInitial()) {
    on<AddTodo>(_saveTodo);
  }

  _saveTodo(AddTodo event, Emitter<AddTodoState> emit) async {
    emit(AddTodoLoadingState());

    final result = await addtodocase.execute(todo: event.todo);
    result.fold(
      // return if left to false
      (failure) => emit(const AddTodoErrorState('succes add todo')),
      // return if right to right
      (data) => emit(const OnAddTodoState('failed add todo')),
    );
  }
}
