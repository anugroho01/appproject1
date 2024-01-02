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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 255, 253, 231),
              appRedSoft
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Column(
            children: [
              Expanded(
                  child: FutureBuilder(
                      future: Future.delayed(Duration(seconds: 2)),
                      builder: (context, index) {
                        if (index.connectionState == ConnectionState.done) {
                          return Obx(() => driverC.isLoading.isTrue
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ListView.builder(
                                  itemCount: driverC.storeData.length,
                                  itemBuilder: (context, snapshot) {
                                    return Card(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: appWhite,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Image.asset(
                                                    "assets/icon/store.jpg"),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            textDirection: TextDirection.ltr,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(driverC.storeData[snapshot]
                                                      .kd_store ??
                                                  'kode toko'),
                                              Text(driverC.storeData[snapshot]
                                                      .nama_toko ??
                                                  ' nama toko'),
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(right: 0),
                                            width: 80,
                                            height: 80,
                                            child: Card(
                                              color: appGreen,
                                              child: GestureDetector(
                                                  onTap: () {
                                                    driverC.openMap(
                                                        driverC
                                                            .storeData[snapshot]
                                                            .lat!,
                                                        driverC
                                                            .storeData[snapshot]
                                                            .long!);
                                                  },
                                                  child: SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child: Center(
                                                      child: Text(
                                                        'Route',
                                                        style: TextStyle(
                                                            color: appWhite),
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }));
                        }
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        );
                      }))
            ],
          ),
        ],
      ),
    );
  }
}
/*
Center(
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
      )
      */