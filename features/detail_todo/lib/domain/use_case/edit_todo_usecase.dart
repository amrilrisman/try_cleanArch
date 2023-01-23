import 'package:core/data/models/todo_model.dart';
import 'package:core/domain/entity/todo_entity.dart';
import 'package:core/domain/repository/todo_repository.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class EditTodoUseCase {
  final TodoRepository todoRepo;
  EditTodoUseCase(this.todoRepo);
  Future<Either<Failure, String>> execute(final TodoModels todo) async {
    return todoRepo.updateTodo(todo: todo);
  }
}
