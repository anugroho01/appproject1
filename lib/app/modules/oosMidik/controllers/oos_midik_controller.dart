import 'dart:convert';

import 'package:appproject1/app/controllers/page_index_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OosMidikController extends GetxController {
  var isLoading = false.obs;
  // OpenseaModel? openseaModel;
  final pageC = Get.put(PageIndexController(), permanent: true);
  List<getPlu> storeData = [];

  // RefreshController refreshC = RefreshController();
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
    // getData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // getData() async {
  //   try {
  //     isLoading(true);
  //     var responseData =
  //         await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
  //     if (responseData.statusCode == 200) {
  //       print(responseData.body);
  //       var body = jsonDecode(responseData.body);
  //       openseaModel = OpenseaModel.fromJson(body);
  //     }
  //   } catch (e) {
  //     print('Error while getting data is $e');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  Future<List<getPlu>> getData() async {
    final apiUrl =
        "https://oos-midikring-v1-lz7ch2oqma-et.a.run.app/oos_mk/get_plu";
    try {
      isLoading(true);
      var responseData = await http.post(Uri.parse(apiUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"store_code": pageC.kd_store.value}));
      if (responseData.statusCode == 200) {
        // print(responseData.body);
        print(pageC.kd_store.value);
        var body = jsonDecode(responseData.body);
        // openseaModel = OpenseaModel.fromJson(body);
        for (Map<String, dynamic> index in body) {
          storeData.add(getPlu.fromJson(index));
        }
        return storeData;
      } else {
        print(responseData.statusCode);
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load Item');
      }
    } catch (e) {
      print('Error while getting data is $e');
      return storeData;
    } finally {
      isLoading(false);
    }
  }
}

class getPlu {
  String? plu;
  String? desc;
  int? qty;
  // double? long;

  getPlu({
    required this.plu,
    required this.desc,
    required this.qty,
    // required this.long,
  });
  factory getPlu.fromJson(Map<String, dynamic> json) => getPlu(
        plu: json["plu"],
        desc: json["name"],
        qty: json["qty"],
        // long: double.parse(json['address']['geo']["lng"]),
      );

  Map<String, dynamic> toJson() => {
        "id": plu,
        "name": desc,
        "lat": qty,
        // "long": long,
      };
}
/*
class OpenseaModel {
  OpenseaModel({
    required this.assets,
  });

  List<Assets>? assets;

  OpenseaModel.fromJson(Map<String, dynamic> json) {
    assets = List.from(json[0]).map((e) => Assets.fromJson(e)).toList();
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
    this.plu,
    this.qty,
    // required this.permalink,
  });

  String? imageUrl;
  String? name;
  String? plu;
  // String? permalink;
  int? qty;

  Assets.fromJson(Map<String, dynamic> json) {
    // imageUrl = json['avatar'];
    name = json['name'];
    plu = json['plu'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    // _data['image_url'] = imageUrl;
    _data['name'] = name;
    _data['description'] = plu;
    _data['permalink'] = qty;
    return _data;
  }
}
*/