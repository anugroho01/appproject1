import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var isLoading = false.obs;
  var islogin = false.obs;
  RxString nik = "".obs;
  var nama = "".obs;
  var kd_store = "".obs;
  RxString nm_store = "".obs;
  RxString jabatan = "".obs;
  RxString email = "".obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getPref();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getPref() async {
    try {
      isLoading(true);
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.reload();
      islogin.value = pref.getBool("is_login")!;
      // print(pref.getString("nik_portal"));
      nik.value = pref.getString("nik_portal")!;
      nama.value = pref.getString("nama")!;
      kd_store.value = pref.getString("kd_store")!;
      // nm_store.value = pref.getString("nm_toko")!;
      email.value = pref.getString("email")!;
      jabatan.value = pref.getString("jabatan")!;
      print("get session ok dr home");
      // print(nik.value);
    } catch (e) {
      print('Gagal memuat Session is $e');
    } finally {
      isLoading(false);
    }
  }
}
