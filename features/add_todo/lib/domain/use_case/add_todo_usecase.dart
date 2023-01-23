import 'package:core/data/models/todo_model.dart';
import 'package:core/domain/entity/todo_entity.dart';
import 'package:core/domain/repository/todo_repository.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class AddTodoUseCase {
  final TodoRepository todoRepository;

  AddTodoUseCase(this.todoRepository);

  Future<Either<Failure, String>> execute({required TodoEntity todo}) async {
    return todoRepository.savenewTodo(todo: todo);
  }
}
