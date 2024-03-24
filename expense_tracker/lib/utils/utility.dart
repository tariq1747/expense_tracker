import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/widgets.dart';

class Utility {
  const Utility._();

  static Future<T?> openBottomSheet<T>(
    Widget child, {
    Color? backgroundColor,
    bool isDismissible = true,
    ShapeBorder? shape,
  }) async =>
      await Get.bottomSheet<T>(
        child,
        barrierColor: Colors.black.withOpacity(0.7),
        backgroundColor: backgroundColor,
        isDismissible: isDismissible,
        shape: shape,
        isScrollControlled: true,
      );

  static Future<TimeOfDay> pickTime({
    required BuildContext context,
    required TimeOfDay initialTime,
  }) async =>
      (await showTimePicker(
        context: context,
        initialTime: initialTime,
        initialEntryMode: TimePickerEntryMode.inputOnly,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        ),
      )) ??
      initialTime;

  /// Show loader
  static void showLoader() async {
    await Get.dialog(
      const AppLoader(),
      barrierDismissible: false,
    );
  }

  /// Close loader
  static void closeLoader() {
    closeDialog();
  }

  /// Show info dialog
  static void showDialog(
    String message,
  ) async {
    await Get.dialog(
      CupertinoAlertDialog(
        title: const Text('Info'),
        content: Text(
          message,
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: Get.back,
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }

  /// Show alert dialog
  static void showAlertDialog({
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog(
      CupertinoAlertDialog(
        title: Text('$title'),
        content: Text('$message'),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: onPress,
            child: Text('yes'.tr),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: closeDialog,
            child: Text('no'.tr),
          )
        ],
      ),
    );
  }

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  /// Close any open snackbar
  static void closeSnackbar() {
    if (Get.isSnackbarOpen) Get.back<void>();
  }
}
