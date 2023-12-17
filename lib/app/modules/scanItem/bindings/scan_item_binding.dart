import 'package:get/get.dart';

import '../controllers/scan_item_controller.dart';

class ScanItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanItemController>(
      () => ScanItemController(),
    );
  }
}
