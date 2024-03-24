import 'package:expense_tracker/controllers/controllers.dart';
import 'package:expense_tracker/res/theme/dimens.dart';
import 'package:expense_tracker/utils/navigators/routes_management.dart';
import 'package:expense_tracker/utils/utils.dart';
import 'package:expense_tracker/widgets/expense_card.dart';
import 'package:expense_tracker/widgets/schedule_notification_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  static const String route = '/home';
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('your expence'),
        actions: [
          IconButton(
              onPressed: () {
                Utility.openBottomSheet(const ScheduleNotification(),
                    backgroundColor: Colors.white);
              },
              icon: const Icon(Icons.notifications))
        ],
      ),
      floatingActionButton: const ElevatedButton(
        onPressed: RouteManagement.goToAdd,
        child: Text('Add+'),
      ),
      body: Obx(() {
        return ListView.separated(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          itemBuilder: (context, index) => ExpenseCart(
            amount: controller.expenseList[index].amount,
            date: controller.expenseList[index].date,
            discription: controller.expenseList[index].description,
            onTapDelete: () {
              controller.onDeleteExpense(
                  controller.expenseList[index].id!.toInt(), index);
            },
            onTapEdit: () {
              RouteManagement.goToAdd(index: index, isEdit: true);
            },
          ),
          separatorBuilder: (context, index) => Dimens.boxHeight10,
          itemCount: controller.expenseList.length,
        );
      }),
    );
  }
}
