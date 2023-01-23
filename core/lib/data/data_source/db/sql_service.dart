import 'dart:async';

import 'package:core/data/models/todo_model.dart';
import 'package:core/domain/entity/todo_entity.dart';
import 'package:core/utils/table_db.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService {
  static DataBaseService? _dbService;

  DataBaseService.instan() {
    _dbService = this;
  }

  factory DataBaseService() => _dbService ?? DataBaseService.instan();

  Database? _database;

  Future<Database> get database async {
    _database ??= await _initialDB();
    return _database!;
  }

  Future<Database> _initialDB() async {
    final pathDb = await getDatabasesPath();
    final createDb = openDatabase(
      '$pathDb/mytodos.db',
      version: 1,
      onCreate: (db, version) => _createDb(
        db: db,
        version: version,
      ),
    );
    return createDb;
  }

  void _createDb({required Database db, required int version}) async {
    await db.execute(
      '''CREATE TABLE ${TableDataBase.todo} (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, subtitle TEXT, active BOOLEAN)''',
    );
  }

  Future<void> insertData({required TodoEntity todo}) async {
    final db = await database;
    await db.insert(TableDataBase.todo, todo.toJson());
  }

  Future<List<TodoModels>> getData() async {
    final db = await database;
    final List<Map<dynamic, dynamic>> data = await db.query(TableDataBase.todo);
    return data.map((e) => TodoModels.fromJson(e)).toList();
  }

  Future<TodoModels> todoById({required String id}) async {
    final db = await database;
    final List<Map<dynamic, dynamic>> data =
        await db.query(TableDataBase.todo, where: 'id=?', whereArgs: [id]);

    return data.map((e) => TodoModels.fromJson(e)).first;
    // return data.map((e) => TodoModels.fromJson(e)).toList();
  }

  Future<void> activeUnactive({required TodoModels todo}) async {
    final db = await database;
    await db.update(
      TableDataBase.todo,
      todo.toJson(),
      where: 'id=?',
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteTodo({required String id}) async {
    final db = await database;
    await db.delete(TableDataBase.todo, where: 'id=?', whereArgs: [id]);
  }

  Future<void> updateTodo({required TodoModels todo}) async {
    final db = await database;
    await db.update(TableDataBase.todo, todo.toJson(),
        where: 'id=?', whereArgs: [todo.id]);
  }
}
