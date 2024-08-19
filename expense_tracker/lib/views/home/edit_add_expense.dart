import 'package:Oppointments/controllers/home/home_controller.dart';
import 'package:Oppointments/res/theme/dimens.dart';
import 'package:Oppointments/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            cont.sessionsFieldControl.text =
                ' ${cont.expenseList[index].sessions}';
            cont.discriptionFieldControl.text =
                ' ${cont.expenseList[index].name}';
            cont.selectedDate = DateTime.parse(cont.expenseList[index].date);
          } else {
            cont.amountFieldControl.clear();
            cont.sessionsFieldControl.clear();
            cont.discriptionFieldControl.clear();
            cont.selectedDate = null;
          }
        },
        id: upDateId,
        builder: (controller) {
          String a = controller.sessionsFieldControl.text.isEmpty
              ? '0'
              : controller.sessionsFieldControl.text;
          String b = controller.amountFieldControl.text.isEmpty
              ? '0'
              : controller.amountFieldControl.text;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  isEditView ? 'Edit Patient details' : 'Add Patient details'),
              centerTitle: true,
              actions: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 80.sp),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'Rs:${num.parse(a) * num.parse(b)}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: Dimens.edgeInsets10,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Dimens.boxHeight32,
                    CustomText(
                        lable: 'Name',
                        child: Textf(
                          readOnly: isEditView,
                          controller: controller.discriptionFieldControl,
                        )),
                    Dimens.boxHeight32,
                    CustomText(
                        lable: 'Pay Amount Rs.',
                        child: Textf(
                          readOnly: isEditView,
                          textInputType: TextInputType.number,
                          controller: controller.amountFieldControl,
                        )),
                    Dimens.boxHeight32,
                    CustomText(
                      lable: 'No. of sessions',
                      child: Textf(
                        textInputType: TextInputType.number,
                        controller: controller.sessionsFieldControl,
                      ),
                    ),
                    Dimens.boxHeight32,
                    CustomText(
                      lable: 'Date',
                      child: TextButton(
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
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black),
              ),
              onPressed: () {
                if (isEditView) {
                  controller.onEditExpense(index);
                } else {
                  controller.onSubmit();
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Save',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          );
        });
  }
}
