import 'dart:ffi';

// import 'package:appproject1/app/controllers/page_index_controller.dart';
import 'package:appproject1/app/modules/login/controllers/login_controller.dart';
// import 'package:appproject1/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/app_pages.dart';
// import 'login_controller.dart';

// void main() {
//   runApp(GetMaterialApp(
//     title: 'Aplikasi',
//     initialRoute:  Routes.LOGIN,
//     getPages: AppPages.routes,
//   ));
// }
// final userdata = GetStorage();
// bool isLogin = userdata.read('isLogged');
// final pageLogin = Get.put(LoginController(), permanent: true);
// final pageC = Get.put(PageIndexController(), permanent: true);
void main() async {
  runApp(MyApp());

  //
  // print(islogin);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<bool> _isLogin;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> ceklog() async {
    final SharedPreferences prefs = await _prefs;
    final isLogin = prefs.getBool('is_login');
    print(isLogin);
    setState(() {
      _isLogin = isLogin as Future<bool>;
    });
  }

  void initState() {
    super.initState();
    _isLogin = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('is_login') ?? true;
    });
  }

  final pageLogin = Get.put(LoginController(), permanent: true);
  // final pageLogin = Get.find<LoginController>();

  Widget build(BuildContext context) {
    //
    return FutureBuilder(
        future: _isLogin,
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Scaffold(
          //     body: Center(
          //       child: CircularProgressIndicator(),
          //     ),
          //   );
          // }

          return GetMaterialApp(
            title: 'Aplikasi',
            initialRoute: Routes.LOGIN,
            // initialRoute: islogin.isTrue
            //     ? Routes.HOME
            //     : Routes.LOGIN, //islogin.isTrue ? Routes.HOME : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        });
  }
}
