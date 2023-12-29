import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_pages.dart';

class PageIndexController extends GetxController {
  @override
  void onInit() {
    _getPref();
    // Get called when controller is created
    super.onInit();
  }

  RxInt pageIndex = 0.obs;
  RxBool islogin = false.obs;
  var isLoading = false.obs;
  RxString nik = "".obs;
  RxString nama = "".obs;
  RxString kd_store = "".obs;
  RxString nm_store = "".obs;
  RxString jabatan = "".obs;
  RxString email = "".obs;
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

  Future<void> _getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      isLoading(true);
      islogin.value = pref.getBool("is_login")!;
      // print(pref.getString("nik_portal"));
      nik.value = pref.getString("nik_portal")!;
      nama.value = pref.getString("nama")!;
      kd_store.value = pref.getString("kd_store")!;
      // nm_store.value = pref.getString("nm_toko")!;
      email.value = pref.getString("email")!;
      jabatan.value = pref.getString("jabatan")!;
    } catch (e) {
      print('Gagal memuat Session is $e');
    } finally {
      isLoading(false);
    }
    // final cekSession = await SharedPreferences.getInstance();

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
