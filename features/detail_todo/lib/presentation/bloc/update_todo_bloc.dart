import 'package:bloc/bloc.dart';
import 'package:core/data/models/todo_model.dart';
import 'package:detail_todo/domain/use_case/edit_todo_usecase.dart';
import 'package:equatable/equatable.dart';

part 'update_todo_event.dart';
part 'update_todo_state.dart';

class UpdateTodoBloc extends Bloc<UpdateTodoEvent, UpdateTodoState> {
  final EditTodoUseCase editTodoUsecase;
  UpdateTodoBloc(
    this.editTodoUsecase,
  ) : super(UpdateTodoInitial()) {
    on<OnUpdateTodoEvent>(_update);
  }

  _update(OnUpdateTodoEvent event, Emitter<UpdateTodoState> emit) async {
    emit(UpdateLoadingState());
    final result = await editTodoUsecase.execute(event.todoModels);
    result.fold(
      (failure) => emit(UpdateErrorState()),
      (data) => emit(const UpdateSuccessState(true)),
    );
  }
}
