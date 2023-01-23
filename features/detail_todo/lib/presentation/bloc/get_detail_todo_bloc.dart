import 'package:bloc/bloc.dart';
import 'package:core/data/models/todo_model.dart';
import 'package:detail_todo/domain/use_case/get_detail_usecase.dart';
import 'package:equatable/equatable.dart';

part 'get_detail_todo_event.dart';
part 'get_detail_todo_state.dart';

class GetDetailTodoBloc extends Bloc<GetDetailTodoEvent, GetDetailTodoState> {
  final GetDetailUseCase getDetailUseCase;
  GetDetailTodoBloc(
    this.getDetailUseCase,
  ) : super(GetDetailTodoInitial()) {
    on<OnGetDetailEvent>(_getDetail);
  }

  _getDetail(OnGetDetailEvent event, Emitter<GetDetailTodoState> emit) async {
    emit(GetDetailTodoLoadingState());
    final result = await getDetailUseCase.execute(event.id);
    result.fold(
      (failure) => emit(GetDetailErrorState()),
      (data) => emit(GetDetailTodoHasDataState(todo: data)),
    );
  }
}
