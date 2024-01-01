import 'dart:ffi';

import 'package:appproject1/app/controllers/page_index_controller.dart';
import 'package:appproject1/app/utils/splash_screen.dart';
// import 'package:appproject1/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart';
import 'app/routes/app_pages.dart';
// import 'login_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // String? nama = prefs.getString('nik_portal');
  // print(islogin);
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // final authC = Get.put(LoginController(), permanent: true);
  final pageLogin = Get.put(PageIndexController(), permanent: true);
  Widget build(BuildContext context) {
    // print('nama' + '${pageLogin.nik.isNotEmpty}');
    // return GetMaterialApp(
    //   // title: "IT Modeler",
    //   initialRoute: pageLogin.nik.isNotEmpty ? Routes.HOME : Routes.LOGIN,
    //   getPages: AppPages.routes,
    // );
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return FutureBuilder(
                future: Future.delayed(Duration(seconds: 3)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Obx(
                      () => GetMaterialApp(
                        // title: "IT Modeler",
                        initialRoute: pageLogin.nik.isNotEmpty
                            ? Routes.PAGE_DRIVER
                            : Routes.LOGIN,
                        getPages: AppPages.routes,
                      ),
                    );
                  }
                  return SplashScreen();
                });
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          );
        });
  }
}
