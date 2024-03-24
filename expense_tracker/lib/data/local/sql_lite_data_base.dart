import 'dart:io';

import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/utils/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqlLiteDB {
  SqlLiteDB._dbInstance();

  static SqlLiteDB? _sqlLiteDB;
  static Database? _database;

  final String _tableName = 'expense_tracker';
  final String _idCol = 'id';
  final String _amountCol = 'amount';
  final String _dateCol = 'date';
  final String _disCol = 'description';

  factory SqlLiteDB.dbInstance() {
    _sqlLiteDB ??= SqlLiteDB._dbInstance();
    return _sqlLiteDB!;
  }

  Future<Database> get getDataBase async {
    _database ??= await _initialization();

    return _database!;
  }

  Future<Database> _initialization() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '$directory expense.db';
    return await openDatabase(path, version: 1, onCreate: _create);
  }

  void _create(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $_tableName($_idCol INTEGER PRIMARY KEY AUTOINCREMENT, $_dateCol TEXT, $_amountCol REAL, $_disCol TEXT)',
    );
  }

  Future<List<Map<String, dynamic>>> getData() async {
    Utility.showLoader();
    Database db = await getDataBase;
    var res = await db.query(
      _tableName,
    );
    Utility.closeLoader();
    return res;
  }

  Future<int> addData(ExpenseModel em) async {
    Utility.showLoader();
    Database db = await getDataBase;

    var res = await db.insert(
      _tableName,
      em.toMap(),
    );
    Utility.closeLoader();
    return res;
  }

  Future<int> deleteData(int id) async {
    Utility.showLoader();
    Database db = await getDataBase;
    var res = await db.delete(_tableName, where: '$_idCol = $id');
    Utility.closeLoader();
    return res;
  }

  Future<int> editData(ExpenseModel em) async {
    Utility.showLoader();
    Database db = await getDataBase;
    var res = await db
        .update(_tableName, em.toMap(), where: '$_idCol=?', whereArgs: [em.id]);
    Utility.closeLoader();
    return res;
  }
}
