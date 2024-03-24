import 'package:expense_tracker/utils/notification_service.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerService {
  void registerMyTask() async {
    await Workmanager().registerPeriodicTask(
      'id1',
      'show simple notification',
      frequency: const Duration(seconds: 10),
    );
  }

  Future<void> init() async {
    await Workmanager().initialize(actionTask, isInDebugMode: true);
    registerMyTask();
  }

  void cancelTask(String id) {
    Workmanager().cancelAll();
  }
}

@pragma('vm-entry-point')
void actionTask() {
  Workmanager().executeTask((taskName, inputData) {
    LocalNotificationService.showDailySchduledNotification(null, null);
    return Future.value(true);
  });
}
