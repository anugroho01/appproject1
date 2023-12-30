import 'package:appproject1/app/constant/color.dart';
import 'package:appproject1/app/controllers/page_index_controller.dart';
import 'package:appproject1/app/modules/trackingDelivery/controllers/tracking_delivery_controller.dart';
import 'package:appproject1/app/routes/app_pages.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/info_delivery_controller.dart';

class InfoDeliveryView extends GetView<InfoDeliveryController> {
  // const InfoDeliveryView({Key? key}) : super(key: key);
  final pageC = Get.put(PageIndexController(), permanent: true);
  // final TrackC = Get.put(TrackingDeliveryController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    // print(TrackC.noPolisi.value);
    return Scaffold(
        body: Stack(
          children: [
            //backgorund
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                const Color.fromARGB(255, 255, 253, 231),
                appRedSoft
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
            SafeArea(
              child: Column(
                children: [
                  //g bisa dscroll
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications_active,
                            color: appPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                      child: ListView(
                    children: [
                      Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          title: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    margin: EdgeInsets.only(right: 15),
                                    decoration: BoxDecoration(
                                      color: appRedSoft,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.asset("assets/icon/truk.png"),
                                  ),
                                  Text(
                                    "Delivery",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('NO POL Disini'),
                                        Card(
                                          color: appRed,
                                          child: GestureDetector(
                                            // splashColor: appWhite,
                                            onTap: () {
                                              Get.offAllNamed(
                                                  Routes.TRACKING_DELIVERY);
                                            },
                                            child: SizedBox(
                                              width: 90,
                                              height: 50,
                                              child: Center(
                                                child: Text('Tracking',
                                                    style: TextStyle(
                                                      color: appWhite,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Estimasi Sampai",
                                            style: TextStyle(
                                              color: appTextSoft,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(child: Text('1 Jam 3 Mnt'))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //volume
                      Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          title: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    // margin: EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                      color: appRedSoft,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.asset("assets/icon/cart.png"),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 8),
                                    DataTable(
                                        columnSpacing: 20,
                                        columns: const <DataColumn>[
                                          DataColumn(
                                            label: Expanded(
                                              child: Text(
                                                'Total Koli',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Expanded(
                                              child: Text(
                                                'Faktur',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Expanded(
                                              child: Text(
                                                'Nilai',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                          )
                                        ],
                                        rows: const <DataRow>[
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(Text('30 kontainer')),
                                              DataCell(Text('xxx-ffff-fff')),
                                              DataCell(Text('76,000,000')),
                                            ],
                                          ),
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(Text('30 Karton')),
                                              DataCell(Text('xxx-ffff-fff')),
                                              DataCell(Text('76,000,000')),
                                            ],
                                          )
                                        ]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //summary
                      Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          title: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    // margin: EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                      color: appRedSoft,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.asset("assets/icon/watch.png"),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 8),
                                    DataTable(
                                        columnSpacing: 20,
                                        columns: const <DataColumn>[
                                          DataColumn(
                                            label: Expanded(
                                              child: Text(
                                                'In-Coming',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Expanded(
                                              child: Text(
                                                'Out-Going',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Expanded(
                                              child: Text(
                                                'Durasi',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                          )
                                        ],
                                        rows: const <DataRow>[
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(Text('14:30')),
                                              DataCell(Text('15:30')),
                                              DataCell(Text('1 Jam ')),
                                            ],
                                          ),
                                        ]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.red,
            items: [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.calendar_today),
              TabItem(icon: Icons.person_outline_sharp, title: 'Profile'),
            ],
            initialActiveIndex: pageC.pageIndex.value,
            onTap: (int i) => pageC.changePage(i)));
  }
}
