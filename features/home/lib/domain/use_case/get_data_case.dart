import 'package:core/data/models/todo_model.dart';
import 'package:core/domain/repository/todo_repository.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GetDataUseCase {
  final TodoRepository todoRepository;

  GetDataUseCase(this.todoRepository);

  Future<Either<Failure, List<TodoModels>>> execute() async {
    return todoRepository.getDataTodo();
  }
}
