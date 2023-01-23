import 'package:core/data/data_source/db/sql_service.dart';
import 'package:core/data/models/todo_model.dart';
import 'package:core/domain/entity/todo_entity.dart';
import 'package:core/utils/db_excaptions.dart';

abstract class DataLocalSource {
  Future<String> savenewTodo({required TodoEntity todo});
  Future<List<TodoModels>> getDataTodo();
  Future<TodoModels> getDataById({required String id});
  Future<String> activeUnactive({required TodoModels todo});
  Future<String> deleteTodo({required String id});
  Future<String> updateTodo({required TodoModels todo});
}

class DataLocalSourceImplementation extends DataLocalSource {
  final DataBaseService dataBaseService;

  DataLocalSourceImplementation({required this.dataBaseService});

  @override
  Future<String> activeUnactive({required TodoModels todo}) async {
    try {
      await dataBaseService.activeUnactive(todo: todo);
      return 'succes active or unactive succes';
    } catch (e) {
      throw DatabaseException('$e');
    }
  }

  @override
  Future<String> deleteTodo({required String id}) async {
    try {
      await dataBaseService.deleteTodo(id: id);
      return 'success delete todo';
    } catch (e) {
      throw DatabaseException('$e');
    }
  }

  @override
  Future<TodoModels> getDataById({required String id}) async {
    try {
      final TodoModels data = await dataBaseService.todoById(id: id);
      return data;
    } catch (e) {
      throw DatabaseException('$e');
    }
  }

  @override
  Future<List<TodoModels>> getDataTodo() async {
    try {
      final List<TodoModels> data = await dataBaseService.getData();
      return data;
    } catch (e) {
      throw DatabaseException('$e');
    }
  }

  @override
  Future<String> updateTodo({required TodoModels todo}) async {
    try {
      await dataBaseService.updateTodo(todo: todo);
      return 'success update data';
    } catch (e) {
      throw DatabaseException('$e');
    }
  }

  @override
  Future<String> savenewTodo({required TodoEntity todo}) async {
    try {
      await dataBaseService.insertData(todo: todo);
      return 'success add todo';
    } catch (e) {
      throw DatabaseException('$e');
    }
  }
}
