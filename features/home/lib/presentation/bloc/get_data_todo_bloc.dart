import 'package:bloc/bloc.dart';
import 'package:core/data/models/todo_model.dart';
import 'package:equatable/equatable.dart';
import 'package:home/domain/use_case/get_data_case.dart';

part 'get_data_todo_event.dart';
part 'get_data_todo_state.dart';

class GetDataTodoBloc extends Bloc<GetDataTodoEvent, GetDataTodoState> {
  final GetDataUseCase todoRepository;
  GetDataTodoBloc(this.todoRepository) : super(GetDataTodoInitialState()) {
    on<OnGetDataTodoEvent>(
      _getData,
    );
  }

  _getData(OnGetDataTodoEvent event, Emitter<GetDataTodoState> emit) async {
    emit(GetDataIsLoading());
    final result = await todoRepository.execute();

    result.fold(
      (failure) => emit(GetDataErrorState('Tidak ada data')) ,
      (data) => emit(GetDataHasData(data)),
    );
  }
}
