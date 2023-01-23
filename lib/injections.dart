// class injection path locator

import 'package:add_todo/domain/use_case/add_todo_usecase.dart';
import 'package:add_todo/presentation/bloc/add_todo_bloc.dart';
import 'package:core/data/data_source/data_source_local.dart';
import 'package:core/data/data_source/db/sql_service.dart';
import 'package:core/data/repository/todo_repository_impl.dart';
import 'package:core/domain/repository/todo_repository.dart';
import 'package:detail_todo/detail_todo.dart';
import 'package:get_it/get_it.dart';
import 'package:home/domain/use_case/get_data_case.dart';
import 'package:home/home.dart';
import 'package:home/presentation/bloc/get_data_todo_bloc.dart';
import 'package:stats/stats.dart';

final GetIt locator = GetIt.instance;

Future initInjection() async {
  /// bloc
  /// register factory berfugnsi objek akan selalu di panggil ketika memanggil atau instance berbeda
  locator.registerFactory<AddTodoBloc>(() => AddTodoBloc(locator()));
  locator.registerFactory<GetDataTodoBloc>(() => GetDataTodoBloc(locator()));
  locator
      .registerFactory<GetDetailTodoBloc>(() => GetDetailTodoBloc(locator()));
  locator.registerFactory<RemoveTodoBloc>(() => RemoveTodoBloc(locator()));
  locator.registerFactory<UpdateTodoBloc>(() => UpdateTodoBloc(locator()));
  locator.registerFactory<ActiveunTodoBloc>(() => ActiveunTodoBloc(locator()));
  locator.registerFactory<StatsTodoBloc>(() => StatsTodoBloc(locator()));

  // usecase
  /// register factory berfugnsi untuk ketika class dipanggil oleh siapapun maka menghasilkan objek yang sama
  locator
      .registerLazySingleton<AddTodoUseCase>(() => AddTodoUseCase(locator()));
  locator
      .registerLazySingleton<GetDataUseCase>(() => GetDataUseCase(locator()));
  locator.registerLazySingleton<GetDetailUseCase>(
      () => GetDetailUseCase(repository: locator()));
  locator.registerLazySingleton<RemoveTodoUseCase>(
      () => RemoveTodoUseCase(locator()));
  locator
      .registerLazySingleton<EditTodoUseCase>(() => EditTodoUseCase(locator()));
  locator.registerLazySingleton<ActiveUnactiveUseCase>(
      () => ActiveUnactiveUseCase(locator()));
  locator.registerLazySingleton<StatsUsecase>(
      () => StatsUsecase(locator()));

  //repository
  locator.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImplementation(dataLocalSource: locator()));

  // db service
  locator.registerLazySingleton<DataBaseService>(() => DataBaseService());

  // repo db
  locator.registerLazySingleton<DataLocalSource>(
      () => DataLocalSourceImplementation(dataBaseService: locator()));
}
