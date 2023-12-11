import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String nik = "";
  String nama = "";
  String kd_store = "";
  String nm_store = "";
  //int tTrx = 0;
  late int tTrx;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // final cekSession = await SharedPreferences.getInstance();

    var islogin = pref.getBool("is_login");
    print(islogin);
    if (islogin != null && islogin == true) {
      setState(() {
        print('ada sessionnya');
        nik = pref.getString("nik_portal")!;
        nama = pref.getString("nama")!;
        kd_store = pref.getString("kd_store")!;
        nm_store = pref.getString("nm_toko")!;
      });
    }
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

    setState(() {
      getPref();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homenya'),
      ),
      body: Text('$nama'),
    );
  }
}
