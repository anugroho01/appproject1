import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/page_index_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final pageC = Get.find<PageIndexController>();
  final pageC = Get.put(PageIndexController(), permanent: true);

  //int tTrx = 0;
  late int tTrx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homenya'),
      ),
      body: Text(pageC.kd_store),
      bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.red,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.calendar_today),
            TabItem(icon: Icons.person_outline_sharp, title: 'Profile'),
          ],
          initialActiveIndex: pageC.pageIndex.value,
          onTap: (int i) => pageC.changePage(i)),
    );
  }
}
