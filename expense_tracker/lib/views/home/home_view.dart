import 'package:Oppointments/controllers/home/home_controller.dart';
import 'package:Oppointments/res/theme/dimens.dart';
import 'package:Oppointments/utils/navigators/routes_management.dart';
import 'package:Oppointments/widgets/expense_card.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  static const String route = '/home';
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.home),
        backgroundColor: Colors.blue[100],
        centerTitle: true,
        title: const Text(
          'Patients',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: const ElevatedButton(
        onPressed: RouteManagement.goToAdd,
        child: Text('Add+',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: Obx(() {
        return ListView.separated(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          itemBuilder: (context, index) => ExpenseCart(
            amount: controller.expenseList[index].amount,
            date: controller.expenseList[index].date,
            discription: controller.expenseList[index].name,
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
