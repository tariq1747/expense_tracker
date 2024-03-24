import 'dart:developer';

import 'package:expense_tracker/data/local/sql_lite_data_base.dart';
import 'package:expense_tracker/models/expense_model.dart';

class HomeRepository {
  HomeRepository(
    this.db,
  );
  final SqlLiteDB db;
  Future<int?> saveData({
    required ExpenseModel em,
  }) async {
    try {
      return await db.addData(em);
    } catch (e) {
      log('error while saving date $e');
    }
    return null;
  }

  Future<List<ExpenseModel>> getData() async {
    try {
      var res = await db.getData();

      return res.map((e) => ExpenseModel.fromMap(e)).toList();
    } catch (e) {
      log('error while saving date $e');
    }
    return [];
  }

  Future<int?> deleteExpense({required int id}) async {
    try {
      var res = await db.deleteData(id);

      return res;
    } catch (e) {
      log('error while saving date $e');
    }
    return null;
  }

  Future<int?> editExpense({
    required ExpenseModel em,
  }) async {
    try {
      var res = await db.editData(em);
      return res;
    } catch (e) {
      log('error while saving date $e');
    }
    return null;
  }
}
