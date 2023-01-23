import 'package:core/domain/repository/todo_repository.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class RemoveTodoUseCase {
  final TodoRepository todoRepository;

  RemoveTodoUseCase(this.todoRepository);
  Future<Either<Failure, String>> execute({required String id}) async {
    return todoRepository.deleteTodo(id: id);
  }
}
