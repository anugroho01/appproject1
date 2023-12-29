import 'dart:ffi';

import 'package:appproject1/app/constant/color.dart';
import 'package:appproject1/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tracking_delivery_controller.dart';

import 'package:timelines/timelines.dart';

class TrackingDeliveryView extends GetView<TrackingDeliveryController> {
  TrackingDeliveryView({Key? key}) : super(key: key);
  final trackC = Get.find<TrackingDeliveryController>();
  @override
  Widget build(BuildContext context) {
    // print(trackC.userData.length);
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
            ),
            Column(
              //g bisa discroll
              children: [
                FutureBuilder(
                    future: Future.delayed(Duration(seconds: 3)),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return FutureBuilder(
                            future: Future.delayed(Duration(seconds: 3)),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Obx(() => trackC.isLoadingDriver.isTrue
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 15, 15, 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  // Display the card's title using a font size of 24 and a dark grey color
                                                  Text(
                                                    trackC.namaSopir.value ??
                                                        'nama',
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      color: Colors.grey[800],
                                                    ),
                                                  ),
                                                  // Add a space between the title and the text
                                                  Container(height: 10),
                                                  // Display the card's text using a font size of 15 and a light grey color
                                                  Text(
                                                    trackC.noPolisi.value ??
                                                        'nopol', //MyStringsSample.card_text,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                  // Add a row with two buttons spaced apart and aligned to the right side of the card
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                              }
                              return CircularProgressIndicator();
                            });
                      }
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      );
                    }),
                SizedBox(
                  height: 25,
                ),
                Obx(() => trackC.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Expanded(
                            child: Timeline.tileBuilder(
                              builder: TimelineTileBuilder.fromStyle(
                                contentsAlign: ContentsAlign.alternating,
                                oppositeContentsBuilder: (context, index) =>
                                    Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      '${trackC.userData[index].kd_store}' ??
                                          ''),
                                ),
                                contentsBuilder: (context, index) {
                                  return Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Text(trackC
                                              .userData[index].jam_masuk
                                              .toString() ??
                                          ''));
                                },
                                itemCount: trackC.userData.length,
                              ),
                            ),
                          )
                    // ListView.builder(
                    //     itemCount: trackC.userData.length,
                    //     itemBuilder: (context, index) {
                    //       // var no_polisi;
                    //       return Container(
                    //         child:
                    //             Text(trackC.userData[index].jam_keluar ?? 'nopol'),
                    //       );
                    //     })
                    )
              ],
            ),
          ],
        ));
  }
}
