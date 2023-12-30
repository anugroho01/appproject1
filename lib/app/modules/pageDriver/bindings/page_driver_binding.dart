import 'package:get/get.dart';

import '../controllers/page_driver_controller.dart';

class PageDriverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageDriverController>(
      () => PageDriverController(),
    );
  }
}
