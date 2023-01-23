import 'package:core/data/models/todo_model.dart';
import 'package:core/domain/repository/todo_repository.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class ActiveUnactiveUseCase {
  final TodoRepository todoRepository;

  ActiveUnactiveUseCase(this.todoRepository);
  Future<Either<Failure, String>> execute(TodoModels todo) async {
    return todoRepository.activeUnactive(todo: todo);
  }
}
