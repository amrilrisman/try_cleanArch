import 'package:core/data/models/todo_model.dart';
import 'package:core/domain/repository/todo_repository.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GetDetailUseCase {
  final TodoRepository repository;
  GetDetailUseCase({required this.repository});

  Future<Either<Failure, TodoModels>> execute(String id) async {
    return repository.getDataById(id: id);
  }
}
