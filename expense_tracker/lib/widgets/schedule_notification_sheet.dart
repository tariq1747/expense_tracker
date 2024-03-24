import 'package:expense_tracker/controllers/home/home_controller.dart';
import 'package:expense_tracker/res/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleNotification extends StatelessWidget {
  const ScheduleNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Dimens.boxHeight32,
          const Text(
            'Schedule Notification Reminder',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Dimens.boxHeight32,
          ElevatedButton(
            onPressed: () async {
              Get.find<HomeController>().scheduleNotification(context);
            },
            child: const Text('Select time'),
          ),
          Dimens.boxHeight32,
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (states) => Colors.red,
            )),
            onPressed: () async {
              Get.find<HomeController>().cancelNotification();
            },
            child: const Text('cancel schedule'),
          ),
          Dimens.boxHeight32,
        ],
      ),
    );
  }
}
