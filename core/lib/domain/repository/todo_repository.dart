import 'package:core/data/models/todo_model.dart';
import 'package:core/domain/entity/todo_entity.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepository {
  Future<Either<Failure, String>> savenewTodo({required TodoEntity todo});
  Future<Either<Failure, List<TodoModels>>> getDataTodo();
  Future<Either<Failure, TodoModels>> getDataById({required String id});
  Future<Either<Failure, String>> activeUnactive({required TodoModels todo});
  Future<Either<Failure, String>> deleteTodo({required String id});
  Future<Either<Failure, String>> updateTodo({required TodoModels todo});
}
