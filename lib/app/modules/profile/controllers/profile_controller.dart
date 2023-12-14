import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  RxString loginnya = ''.obs;
  void isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String loginnya = prefs.getString('nik_portal')!;
  }

  // void setState(Null Function() param0) {}
}
