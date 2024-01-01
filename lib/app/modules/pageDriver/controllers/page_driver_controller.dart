import 'dart:convert';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class PageDriverController extends GetxController {
  //TODO: Implement PageDriverController
  var isLoading = false.obs;
  List<storeRoute> storeData = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    fetchRoute();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> openMap(double lat, double long) async {
    var gMapsUrl =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$long");

    if (await canLaunchUrl(gMapsUrl as Uri)) {
      await launchUrl(gMapsUrl as Uri);
    } else {
      throw 'Gagal Konek G-Maps';
    }
  }

  Future<List<storeRoute>> fetchRoute() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        // print(response.body);
        // print(DateFormat.yMMMd().format(DateTime.now()));
        var datanta = jsonDecode(response.body);
        // List result = await json.decode(response.body)?.toList() ?? [];
        for (Map<String, dynamic> index in datanta) {
          storeData.add(storeRoute.fromJson(index));
        }
        // print(result.length);
        return storeData;
      } else {
        print('error bukan 200');
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load Track');
      }
    } catch (e) {
      print(e.toString());
      print('error try teacking');
      return storeData;
    } finally {
      isLoading(false);
    }
  }
}

List<storeRoute> userModelsFromJson(String str) =>
    List<storeRoute>.from(json.decode(str).map((x) => storeRoute.fromJson(x)));

String userModelsToJson(List<storeRoute> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class storeRoute {
  String? kd_store;
  String? nama_toko;
  double? lat;
  double? long;

  storeRoute({
    required this.kd_store,
    required this.nama_toko,
    required this.lat,
    required this.long,
  });
  factory storeRoute.fromJson(Map<String, dynamic> json) => storeRoute(
        nama_toko: json["name"],
        kd_store: json["username"],
        lat: double.parse(json['address']['geo']["lat"]) ?? 0.0,
        long: double.parse(json['address']['geo']["lng"]) ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "id": nama_toko,
        "name": kd_store,
        "lat": lat,
        "long": long,
      };
}
