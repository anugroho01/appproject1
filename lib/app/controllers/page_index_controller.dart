import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_pages.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;
  RxBool islogin = false.obs;
  String nik = "";
  String nama = "";
  String kd_store = "";
  String nm_store = "";
  void changePage(int i) async {
    switch (i) {
      case 2:
        pageIndex.value = i;
        Get.offAllNamed(Routes.PROFILE);
        break;
      default:
        pageIndex.value = i;
        Get.offAllNamed(Routes.HOME);
    }
  }

  void getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // final cekSession = await SharedPreferences.getInstance();

    var islogin = pref.getBool("is_login");
    // print(islogin);
    if (islogin != null && islogin == true) {
      print('ada sessionnya');
      nik = pref.getString("nik_portal")!;
      nama = pref.getString("nama")!;
      kd_store = pref.getString("kd_store")!;
      nm_store = pref.getString("nm_toko")!;
    }
    ;
    // else {
    //   Navigator.of(context, rootNavigator: true).pop();
    //   Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(
    //       builder: (BuildContext context) => const MyApp(),
    //     ),
    //     (route) => false,
    //   );
    // }
  }
}
