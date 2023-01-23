import 'package:bloc/bloc.dart';
import 'package:core/utils/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:stats/domain/use_case.dart/stats_usecase.dart';

part 'stats_todo_event.dart';
part 'stats_todo_state.dart';

class StatsTodoBloc extends Bloc<StatsTodoEvent, StatsTodoState> {
  final StatsUsecase useCase;
  StatsTodoBloc(
    this.useCase,
  ) : super(StatsTodoInitial()) {
    on<OnStatsTodo>(_getDataStats);
  }

  _getDataStats(OnStatsTodo event, Emitter<StatsTodoState> emit) async {
    emit(StatsTodoLoading());
    final result = await useCase.execute();

    result.fold(
      (failure) => emit(const StatsTodoError(
        {
          'active': 0,
          'unActive': 0,
        },
      )),
      (data) {
        int active = 0;
        int Unactive = 0;

        for (var item in data) {
          if (item.active == true) {
            active++;
          } else {
            Unactive++;
          }
        }

        return emit(StatsTodoSuccess(
          {
            'active': active,
            'unActive': Unactive,
          },
        ));
      },
    );
  }
}
