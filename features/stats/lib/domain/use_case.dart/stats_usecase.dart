import 'package:core/data/models/todo_model.dart';
import 'package:core/domain/repository/todo_repository.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class StatsUsecase {
  final TodoRepository todo;

  StatsUsecase(this.todo);

  Future<Either<Failure, List<TodoModels>>> execute() {
    return todo.getDataTodo();
  }
}
