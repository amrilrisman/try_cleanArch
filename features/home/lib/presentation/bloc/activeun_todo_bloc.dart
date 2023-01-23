import 'package:bloc/bloc.dart';
import 'package:core/data/models/todo_model.dart';
import 'package:equatable/equatable.dart';
import 'package:home/domain/use_case/active_unactive_usecase.dart';

part 'activeun_todo_event.dart';
part 'activeun_todo_state.dart';

class ActiveunTodoBloc extends Bloc<ActiveunTodoEvent, ActiveunTodoState> {
  final ActiveUnactiveUseCase usecase;
  ActiveunTodoBloc(
    this.usecase,
  ) : super(ActiveunTodoInitial()) {
    on<OnActiveEvent>(_activeUn);
  }

  _activeUn(OnActiveEvent event, Emitter<ActiveunTodoState> emit) async {
    final result = await usecase.execute(event.todo);

    result.fold(
      (failure) => ActiveunTodoError(),
      (data) => ActiveunTodoSuccess(),
    );
  }
}
