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
            Obx(() => pageOOS.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('plu'), numeric: false),
                            DataColumn(label: Text('desc')),
                            DataColumn(label: Text('qty'))
                          ],
                          rows: List.generate(
                              pageOOS.openseaModel?.assets?.length ?? 0,
                              (index) {
                            return DataRow(cells: [
                              DataCell(Text(
                                  pageOOS.openseaModel?.assets![index].name ??
                                      'no id')),
                              DataCell(Text(
                                  pageOOS.openseaModel?.assets![index].email ??
                                      'no id')),
                              DataCell(Text(pageOOS
                                      .openseaModel?.assets![index].qty
                                      .toString() ??
                                  "0"))
                            ]);
                          }),
                          showBottomBorder: true,
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
