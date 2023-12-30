import 'package:appproject1/app/constant/color.dart';
import 'package:appproject1/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/page_driver_controller.dart';

class PageDriverView extends GetView<PageDriverController> {
  // const PageDriverView({Key? key}) : super(key: key);
  final driverC = Get.find<PageDriverController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('PageDriverView'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.toNamed(Routes.HOME),
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          )),
      body: Center(
        child: Card(
          color: appGreen,
          child: GestureDetector(
            onTap: () {
              driverC.openMap(-6.359226623379601, 106.58085916417888);
            },
            child: SizedBox(
              width: 90,
              height: 50,
              child: Center(
                child: Text('Launch GMaps',
                    style: TextStyle(
                      color: appWhite,
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
