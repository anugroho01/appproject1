import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/page_index_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  // const HomeView({super.key});

  // final pageC = Get.find<PageIndexController>();
  final pageC = Get.put(PageIndexController(), permanent: true);

  //int tTrx = 0;
  late int tTrx;

  @override
  Widget build(BuildContext context) {
    print(pageC.isLoading.value);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 235, 165, 178)
          ],
        )),
        child: Column(
          children: [
            Container(
              height: 25,
            ),
            Obx(() => pageC.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Card(
                    // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // Set the clip behavior of the card
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    // Define the child widgets of the card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                        // Image.asset(
                        //   ImgSample.get('google.png'),
                        //   height: 160,
                        //   width: double.infinity,
                        //   fit: BoxFit.cover,
                        // ),
                        // Add a container with padding that contains the card's title, text, and buttons
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Display the card's title using a font size of 24 and a dark grey color
                              Text(
                                "${pageC.nama.value}",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.grey[800],
                                ),
                              ),
                              // Add a space between the title and the text
                              Container(height: 10),
                              // Display the card's text using a font size of 15 and a light grey color
                              Text(
                                '${pageC.kd_store.value}', //MyStringsSample.card_text,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              ),
                              // Add a row with two buttons spaced apart and aligned to the right side of the card
                              Row(
                                children: <Widget>[
                                  // Add a spacer to push the buttons to the right side of the card
                                  const Spacer(),
                                  // Add a text button labeled "SHARE" with transparent foreground color and an accent color for the text
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.transparent,
                                    ),
                                    child: const Text(
                                      "SHARE",
                                      style:
                                          TextStyle(color: Color(0xFFFF4081)),
                                    ),
                                    onPressed: () {},
                                  ),
                                  // Add a text button labeled "EXPLORE" with transparent foreground color and an accent color for the text
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.transparent,
                                    ),
                                    child: const Text(
                                      "EXPLORE",
                                      style:
                                          TextStyle(color: Color(0xFFFF4081)),
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Add a small space between the card and the next widget
                        Container(height: 5),
                      ],
                    ),
                  )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 115,
                    child: Card(
                      // margin: EdgeInsetsDirectional.only(start: 0.0, end: 0.0),
                      child: InkWell(
                        splashColor: Colors.red.withAlpha(30),
                        onTap: () {
                          Get.offAllNamed(Routes.INFO_DELIVERY);
                        },
                        child: SizedBox(
                          width: 200,
                          height: 100,
                          child: Center(child: Text('Info Delivery')),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 115,
                    child: Card(
                      // margin: EdgeInsetsDirectional.only(start: 0.0, end: 0.0),
                      child: InkWell(
                        splashColor: Colors.red.withAlpha(30),
                        onTap: () {
                          Get.offAllNamed(Routes.OOS_MIDIK);
                        },
                        child: SizedBox(
                          width: 200,
                          height: 100,
                          child: Center(child: Text('OOS Midikriing')),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 115,
                    child: Card(
                      // margin: EdgeInsetsDirectional.only(start: 0.0, end: 0.0),
                      child: InkWell(
                        splashColor: Colors.red.withAlpha(30),
                        onTap: () {
                          Get.offAllNamed(Routes.SCAN_ITEM);
                        },
                        child: SizedBox(
                          width: 200,
                          height: 100,
                          child: Center(child: Text('Cek Item')),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
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

class ImgSample {
  static String get(String name) {
    return 'assets/logo/$name';
  }
}
