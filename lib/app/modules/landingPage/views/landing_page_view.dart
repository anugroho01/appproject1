import 'package:appproject1/app/routes/app_pages.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/landing_page_controller.dart';
import '../../../controllers/page_index_controller.dart';

class LandingPageView extends StatelessWidget {
  // const LandingPageView({super.key});
  final pageC = Get.find<PageIndexController>();
  @override
  Widget build(BuildContext context) {
    // final LandingPageController landingPageController =        Get.put(LandingPageController(), permanent: false);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.red,
            items: [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.calendar_today),
              TabItem(icon: Icons.person_outline_sharp, title: 'Profile'),
            ],
            initialActiveIndex: pageC.pageIndex.value,
            onTap: (int i) => pageC.changePage(i)),
      ),
    );
  }
}
