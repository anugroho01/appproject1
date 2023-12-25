import 'package:appproject1/app/constant/color.dart';
import 'package:appproject1/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tracking_delivery_controller.dart';

class TrackingDeliveryView extends GetView<TrackingDeliveryController> {
  const TrackingDeliveryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('TrackingDeliveryView'),
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Get.toNamed(Routes.INFO_DELIVERY),
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
            )),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                const Color.fromARGB(255, 255, 253, 231),
                appRedSoft
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            )
          ],
        ));
  }
}
