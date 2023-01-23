import 'dart:io';

import 'package:core/data/data_source/data_source_local.dart';
import 'package:core/data/models/todo_model.dart';
import 'package:core/domain/entity/todo_entity.dart';
import 'package:core/domain/repository/todo_repository.dart';
import 'package:core/utils/db_excaptions.dart';
import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';

class TodoRepositoryImplementation extends TodoRepository {
  final DataLocalSource dataLocalSource;

  TodoRepositoryImplementation({required this.dataLocalSource});

  @override
  Future<Either<Failure, String>> activeUnactive(
      {required TodoModels todo}) async {
    try {
      final String result = await dataLocalSource.activeUnactive(todo: todo);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('server error'));
    } on SocketException {
      return const Left(ConnectionFailure('lost connection'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteTodo({required String id}) async {
    try {
      final String result = await dataLocalSource.deleteTodo(id: id);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('server error'));
    } on SocketException {
      return const Left(ConnectionFailure('lost connection'));
    }
  }

  @override
  Future<Either<Failure, TodoModels>> getDataById({required String id}) async {
    try {
      final TodoModels data = await dataLocalSource.getDataById(id: id);
      return Right(data);
    } on ServerException {
      return const Left(ServerFailure('server error'));
    } on SocketException {
      return const Left(ConnectionFailure('lost connection'));
    }
  }

  @override
  Future<Either<Failure, List<TodoModels>>> getDataTodo() async {
    try {
      final List<TodoModels> result = await dataLocalSource.getDataTodo();

      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('server error'));
    } on SocketException {
      return const Left(ConnectionFailure('lost connection'));
    }
  }

  @override
  Future<Either<Failure, String>> savenewTodo(
      {required TodoEntity todo}) async {
    try {
      final String result = await dataLocalSource.savenewTodo(todo: todo);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('server error'));
    } on SocketException {
      return const Left(ConnectionFailure('lost connection'));
    }
  }

  @override
  Future<Either<Failure, String>> updateTodo({required TodoModels todo}) async {
    try {
      final String result = await dataLocalSource.updateTodo(todo: todo);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('server error'));
    } on SocketException {
      return const Left(ConnectionFailure('lost connection'));
    }
  }
}
