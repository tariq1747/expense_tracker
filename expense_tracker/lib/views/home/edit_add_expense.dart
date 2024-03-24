import 'package:expense_tracker/controllers/controllers.dart';
import 'package:expense_tracker/res/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddEditExpense extends StatelessWidget {
  AddEditExpense({super.key})
      : index = Get.arguments['index'],
        isEditView = Get.arguments['isEdit'];
  final int index;
  final bool isEditView;
  static const String route = '/add-edit-expance';
  static const String upDateId = 'add-expense-view';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        initState: (state) {
          var cont = Get.find<HomeController>();
          if (isEditView) {
            cont.amountFieldControl.text = ' ${cont.expenseList[index].amount}';
            cont.discriptionFieldControl.text =
                ' ${cont.expenseList[index].description}';
            cont.selectedDate = DateTime.parse(cont.expenseList[index].date);
          } else {
            cont.amountFieldControl.clear();
            cont.discriptionFieldControl.clear();
            cont.selectedDate = null;
          }
        },
        id: upDateId,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(isEditView ? 'Edit' : 'Add'),
              centerTitle: true,
            ),
            body: Padding(
              padding: Dimens.edgeInsets10,
              child: Column(
                children: [
                  TextField(
                    controller: controller.discriptionFieldControl,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    maxLines: 3,
                  ),
                  Dimens.boxHeight32,
                  Row(
                    children: [
                      const Text(
                        'Amount:',
                        style: TextStyle(fontSize: 16),
                      ),
                      Dimens.boxWidth10,
                      Expanded(
                        child: TextField(
                          controller: controller.amountFieldControl,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: '0.00',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight32,
                  Row(
                    children: [
                      const Text(
                        'Date:',
                        style: TextStyle(fontSize: 16),
                      ),
                      Dimens.boxWidth10,
                      TextButton(
                        onPressed: () {
                          controller.onTapSelectDate(context);
                        },
                        child: controller.selectedDate == null
                            ? const Text(
                                'Select Date',
                                style: TextStyle(color: Colors.blue),
                              )
                            : Text(
                                DateFormat('yyyy-MM-dd').format(
                                  controller.selectedDate!,
                                ),
                              ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight32,
                  ElevatedButton(
                    onPressed: () {
                      if (isEditView) {
                        controller.onEditExpense(index);
                      } else {
                        controller.onSubmit();
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
