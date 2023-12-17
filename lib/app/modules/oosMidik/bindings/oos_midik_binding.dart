import 'package:get/get.dart';

import '../controllers/oos_midik_controller.dart';

class OosMidikBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OosMidikController>(
      () => OosMidikController(),
    );
  }
}
