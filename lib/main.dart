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
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? nama = prefs.getString('nik_portal');
  // print(islogin);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool loginnya = false;
  String loginnya = '';
  // Object? get nama => null;
  // Double? loginnya;
  @override
  void initState() {
    super.initState();
    _isLogin();
  }

  void _isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // loginnya = prefs.getDouble('is_login') as bool;
      loginnya = prefs.getString('nik_portal')!;
      // print(nama);
    });
  }

  final pageLogin = Get.put(LoginController(), permanent: true);
  // final pageLogin = Get.find<LoginController>();

  Widget build(BuildContext context) {
    // print(pageLogin.islogin.obs);
    print(loginnya.isEmpty);
    return FutureBuilder(
        future: null,
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
            // initialRoute: Routes.LOGIN,
            initialRoute: loginnya.isEmpty
                ? Routes.HOME
                : Routes.LOGIN, //islogin.isTrue ? Routes.HOME : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        });
  }
}
