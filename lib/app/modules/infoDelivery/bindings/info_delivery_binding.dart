import 'package:get/get.dart';

import '../controllers/info_delivery_controller.dart';

class InfoDeliveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoDeliveryController>(
      () => InfoDeliveryController(),
    );
  }
}
