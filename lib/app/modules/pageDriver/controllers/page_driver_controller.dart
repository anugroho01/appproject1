import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PageDriverController extends GetxController {
  //TODO: Implement PageDriverController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> openMap(double lat, double long) async {
    var gMapsUrl =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$long");

    if (await canLaunchUrl(gMapsUrl as Uri)) {
      await launchUrl(gMapsUrl as Uri);
    } else {
      throw 'Gagal Konek G-Maps';
    }
  }
}
