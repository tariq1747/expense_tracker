import 'package:expense_tracker/data/local/sql_lite_data_base.dart';
import 'package:get/get.dart';

import '../../repositories/repositories.dart';

import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        HomeRepository(SqlLiteDB.dbInstance()),
      ),
    );
  }
}
