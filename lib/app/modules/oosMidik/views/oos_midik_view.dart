import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/oos_midik_controller.dart';

class OosMidikView extends GetView<OosMidikController> {
  // const OosMidikView({Key? key}) : super(key: key);
  final pageOOS = Get.find<OosMidikController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Report OOS Midikriing'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.toNamed(Routes.HOME),
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          )),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                pageOOS.getData();
              },
              child: Text('Refresh Data'),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(() => pageOOS.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: Column(
                          children: [
                            ListTile(
                              title: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "PLU",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  Expanded(
                                      child: Text("Desc",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  Expanded(
                                      child: Text("Qty",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.right)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: pageOOS.storeData.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                                pageOOS.storeData?[index].plu ??
                                                    'no id'),
                                          ),
                                          Expanded(
                                            child: Text(pageOOS
                                                    .storeData?[index].desc ??
                                                'no id'),
                                          ),
                                          Expanded(
                                            child: Text(
                                              pageOOS.storeData?[index].qty
                                                      .toString() ??
                                                  "0",
                                              textAlign: TextAlign.right,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      )
                // ListView.builder(
                //     itemCount: pageOOS.openseaModel?.assets?.length ?? 0,
                //     itemBuilder: (context, index) {
                //       return ListTile(
                //           title: Text(
                //               pageOOS.openseaModel?.assets![index].email ??
                //                   'no name'));
                //     },
                //     shrinkWrap: true)
                )
          ],
        ),
      ),
    );
  }
}
