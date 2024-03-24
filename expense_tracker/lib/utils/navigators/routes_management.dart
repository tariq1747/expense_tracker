import 'package:get/get.dart';

import 'app_pages.dart';

abstract class RouteManagement {
  /// Go to the SignIn Screen

  /// Go to the Home Screen
  static void goToHome() {
    Get.offAllNamed<void>(
      Routes.home,
    );
  }

  static void goToAdd({
    int index = 0,
    bool isEdit = false,
  }) {
    Get.toNamed<void>(Routes.addExpense, arguments: {
      'index': index,
      'isEdit': isEdit,
    });
  }
}
