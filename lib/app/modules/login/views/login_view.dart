import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  //   TextEditingController nikcontroller = TextEditingController();
  // TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: controller.nik,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'NIK', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.pin,
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'PIN', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() => ElevatedButton(
                  onPressed: () async {
                    if (controller.isLoading.isFalse) {
                      await controller.cekLogin();
                    }
                  },
                  child: Text(
                      controller.isLoading.isFalse ? "Login" : "Loading..."),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                )),
            TextButton(onPressed: () {}, child: Text("Reset Pin?"))
          ],
        ));
  }
}
