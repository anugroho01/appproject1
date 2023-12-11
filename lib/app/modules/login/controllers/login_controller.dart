import 'dart:convert';

import 'package:appproject1/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  RxBool isLoading = false.obs;

  TextEditingController nik = TextEditingController();
  TextEditingController pin = TextEditingController();

  Future<void> cekLogin() async {
    isLoading.value = true;
    if (nik.text.isNotEmpty && pin.text.isNotEmpty) {
      try {
        var queryparams = {
          'xnik': nik.text,
          'xpin': pin.text,
        };

        var url = Uri.http('midigateway.mu.co.id', '/midiapi/cek_login.php',
            queryparams as Map<String, dynamic>?);
        final response = await http.get(
          url,
          headers: {"Accept": "application/json"},
        );
        var data = json.decode(response.body);
        List result = await json.decode(response.body)?.toList() ?? [];
        print(data);
        print(result[0]['nama']);
        if (response.statusCode == 200) {
          print('Login successfully');
          if (result[0]['sukses'] == 'T') {
            SharedPreferences pref = await SharedPreferences.getInstance();
            await pref.setString("nik_portal", nik.text);
            await pref.setString("nama", result[0]['nama']);
            await pref.setString("kd_store", result[0]['toko']);
            await pref.setString("jabatan", result[0]['jabatan']);
            await pref.setBool("is_login", true);

            // final myMapsPref = jsonEncode({
            //   "is_login": true,
            //   "nik_portal": nik.text,
            //   "nama": result[0]['nama'],
            //   "kd_store": result[0]['toko'],
            //   "jabatan": result[0]['jabatan'],
            //   "kd_branch": result[0]['branch']
            // });
            // pref.setString('authData', myMapsPref);
            Get.offAllNamed(Routes.HOME);
            isLoading.value = false;
          } else {
            isLoading.value = false;
            Get.snackbar("Terjadi Kesalahan", "NIK dan PIN tidak sesuai!!");
          }

          // saveSession(nik.text, result[0]['nama'], result[0]['toko'],
          //     result[0]['nm_toko'], result[0]['branch'], result[0]['jabatan']);
        } else {
          print('failed');
          isLoading.value = false;
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      isLoading.value = false;
      Get.snackbar("Terjadi Kesalahan", "PIN dan NIK wajib di isi!");
    }
  }

  Future<void> autoLogin() async {
    final pref = await SharedPreferences.getInstance();

    final myData = pref.get('authData');
  }
}
