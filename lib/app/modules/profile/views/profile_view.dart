import 'dart:ffi';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../controllers/page_index_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  // const ProfileView({Key? key}) : super(key: key);

  final pageC = Get.find<PageIndexController>();
  final userdata = GetStorage();
  final user = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    // var nama;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.logout), color: Colors.black)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Column(
                    children: [
                      AvatarGlow(
                        // endRadius: 110,
                        // glowColor: Colors.red,
                        // duration: Duration(seconds: 2),
                        child: Container(
                          width: 175,
                          height: 175,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/logo/noimage.png",
                                  fit: BoxFit.cover)
                              // authC.user.value.photoUrl == "noimage"
                              //     ? Image.asset("assets/logo/noimage.png",
                              //         fit: BoxFit.cover)
                              //     : Image.network(authC.user.value.photoUrl!,
                              //         fit: BoxFit.cover)
                              ),
                        ),
                      ),
                      Text("${userdata.read('nama')}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            label: Text("${userdata.read('email')}"),
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(color: Colors.red)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            label: Text("${userdata.read('nik_portal')}"),
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(color: Colors.red)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            label: Text("${userdata.read('jabatan')}"),
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(color: Colors.red)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20)),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.red,
            items: [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.calendar_today),
              TabItem(icon: Icons.person_outline_sharp, title: 'Profile'),
            ],
            initialActiveIndex: pageC.pageIndex.value,
            onTap: (int i) => pageC.changePage(i)));
  }
}
