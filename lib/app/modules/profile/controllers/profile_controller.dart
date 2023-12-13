import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  void onInit() {
    super.onInit();
    getPref();
  }

  void getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // final cekSession = await SharedPreferences.getInstance();

    var islogin = pref.getBool("is_login");
    // print('ada sessionnya');
    // setState(() {});
    var nik = pref.getString("nik_portal")!;
    var nama = pref.getString("nama")!;
    var kd_store = pref.getString("kd_store")!;
    var nm_store = pref.getString("nm_toko")!;
  }
}
