import 'dart:async';

import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/repositories/home_repository.dart';
import 'package:expense_tracker/utils/notification_service.dart';
import 'package:expense_tracker/utils/utils.dart';
import 'package:expense_tracker/views/home/edit_add_expense.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  HomeController(this._repository);

  final HomeRepository _repository;

  TextEditingController discriptionFieldControl = TextEditingController();
  TextEditingController amountFieldControl = TextEditingController();

  DateTime? selectedDate;

  final RxList<ExpenseModel> _expenseList = <ExpenseModel>[].obs;
  List<ExpenseModel> get expenseList => _expenseList;
  set expenseList(List<ExpenseModel> value) => _expenseList.value = value;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
    super.onInit();
  }

  void onTapSelectDate(BuildContext context) async {
    var currentDate = DateTime.now();
    var picked = await showDatePicker(
      context: context,
      firstDate: currentDate,
      lastDate:
          DateTime(currentDate.year + 1, currentDate.month, currentDate.day),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }

    update([AddEditExpense.upDateId]);
  }

  void getData() async {
    expenseList = await _repository.getData();
  }

  void onDeleteExpense(int id, int index) async {
    var res = await _repository.deleteExpense(id: id);
    if (res != null) {
      expenseList.removeAt(index);
    } else {
      Utility.showDialog('expense not deleted retry');
    }
  }

  void onEditExpense(int index) async {
    if (discriptionFieldControl.text.trim().isNotEmpty &&
        selectedDate != null &&
        amountFieldControl.text.trim().isNotEmpty) {
      var res = await _repository.editExpense(
        em: ExpenseModel(
          id: expenseList[index].id,
          date: DateFormat('yyyy-MM-dd').format(
            selectedDate!,
          ),
          amount: double.parse(
            amountFieldControl.text.trim(),
          ),
          description: discriptionFieldControl.text.trim(),
        ),
      );

      if (res != null) {
        Utility.showAlertDialog(
            title: 'Done',
            message: 'your expense is edited \n want to go back',
            onPress: () {
              Get.back();
              Get.back();
            });
        getData();
      } else {
        Utility.showDialog('expense not edited retry');
      }
    } else {
      Utility.showAlertDialog(message: 'required fields are missing');
    }
  }

  void onSubmit() async {
    if (discriptionFieldControl.text.trim().isNotEmpty &&
        selectedDate != null &&
        amountFieldControl.text.trim().isNotEmpty) {
      var res = await _repository.saveData(
        em: ExpenseModel(
          id: null,
          date: DateFormat('yyyy-MM-dd').format(
            selectedDate!,
          ),
          amount: int.parse(
            amountFieldControl.text.trim(),
          ),
          description: discriptionFieldControl.text.trim(),
        ),
      );

      if (res != null) {
        Utility.showDialog('your expense is Save');
        getData();
        discriptionFieldControl.clear();
        selectedDate = null;
        amountFieldControl.clear();

        update([AddEditExpense.upDateId]);
      } else {
        Utility.showDialog('expense not save retry');
      }
    }
  }

  Future<void> scheduleNotification(BuildContext context) async {
    var time =
        await Utility.pickTime(context: context, initialTime: TimeOfDay.now());

    LocalNotificationService.showDailySchduledNotification(
        time.hour, time.minute);
    Utility.showDialog(
        'you will remind every day at ${time.hour}:${time.minute}');
  }

  Future<void> cancelNotification() async {
    LocalNotificationService.cancelNotification();
    Utility.showDialog('schedule is canceled');
  }
}
