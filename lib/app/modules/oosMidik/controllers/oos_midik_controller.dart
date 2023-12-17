import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OosMidikController extends GetxController {
  var isLoading = false.obs;
  OpenseaModel? openseaModel;
  //TODO: Implement OosMidikController
  // RxMap<String, dynamic> body = Map<String, dynamic>().obs;
  final count = 0.obs;
  @override
  void onInit() {
    // getData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getData() async {
    try {
      isLoading(true);
      var responseData =
          await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
      if (responseData.statusCode == 200) {
        print(responseData.body);
        var body = jsonDecode(responseData.body);
        openseaModel = OpenseaModel.fromJson(body);
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}

class OpenseaModel {
  OpenseaModel({
    required this.assets,
  });

  List<Assets>? assets;

  OpenseaModel.fromJson(Map<String, dynamic> json) {
    assets = List.from(json['data']).map((e) => Assets.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = assets!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Assets {
  Assets({
    required this.imageUrl,
    required this.name,
    this.email,
    this.qty,
    // required this.permalink,
  });

  String? imageUrl;
  String? name;
  String? email;
  // String? permalink;
  int? qty;

  Assets.fromJson(Map<String, dynamic> json) {
    imageUrl = json['avatar'];
    name = json['first_name'];
    email = json['email'];
    qty = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image_url'] = imageUrl;
    _data['name'] = name;
    _data['description'] = email;
    _data['permalink'] = qty;
    return _data;
  }
}
