import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

class TrackingDeliveryController extends GetxController {
  //TODO: Implement TrackingDeliveryController

  var isLoading = false.obs;
  List<TrackingModel> userData = [];

  var isLoadingDriver = false.obs;
  // List<DriverModel> driverData = [];

  RxString namaSopir = "".obs;
  RxString noPolisi = "".obs;
  final count = 0.obs;
  @override
  void onInit() {
    fetchTrack();
    // ambilSopir();
    super.onInit();
  }

  @override
  void onReady() {
    ambilSopir();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

//https://658a79cbba789a9622372083.mockapi.io/apitest/v1/tracking
//https://reqres.in/api/users?page=2
  Future<List<TrackingModel>> fetchTrack() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(
          'https://658a79cbba789a9622372083.mockapi.io/apitest/v1/tracking'));
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        // print(response.body);
        // print(DateFormat.yMMMd().format(DateTime.now()));
        var datanta = jsonDecode(response.body);
        for (Map<String, dynamic> index in datanta) {
          userData.add(TrackingModel.fromJson(index));
        }
        // print(userData.length);
        return userData;
      } else {
        print('error bukan 200');
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load Track');
      }
    } catch (e) {
      print(e.toString());
      print('error try teacking');
      return userData;
    } finally {
      isLoading(false);
    }
  }

  Future<void> ambilSopir() async {
    try {
      isLoadingDriver(true);
      final responseDriver = await http.get(Uri.parse(
          'https://658a79cbba789a9622372083.mockapi.io/apitest/v1/getDriver/3'));
      if (responseDriver.statusCode == 200) {
        var data = json.decode(responseDriver.body);
        // List result = await json.decode(responseDriver.body)?.toList() ?? [];
        namaSopir.value = data['nama_driver'];
        noPolisi.value = data['no_pol'];

        print(data);
        print(data['nama_driver']);
      } else {
        print('gagal get');
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingDriver(false);
    }
  }
/*
  Future<DriverModel> fetchDrivers() async {
    try {
      isLoadingDriver(true);
      final responseDriver = await http.get(Uri.parse(
          'https://658a79cbba789a9622372083.mockapi.io/apitest/v1/getDriver/3'));
      if (responseDriver.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        // print(responseDriver.body);
        // print(DateFormat.yMMMd().format(DateTime.now()));
        // var datadriver = jsonDecode(responseDriver.body);
        // driverData.add(DriverModel.fromJson(datadriver));
        // List result = await json.decode(responseDriver.body)?.toList() ?? [];
        var driverData = DriverModel.fromJson(
            jsonDecode(responseDriver.body) as Map<String, dynamic>);
        // return DriverModel.fromJson(
        //     jsonDecode(responseDriver.body) as Map<String, dynamic>);
        // for (Map<String, dynamic> index in datadriver) {
        //   driverData.add(DriverModel.fromJson(index));
        // }
        // print(result[0]['nama_driver']);
        return driverData;
      } else {
        print('error bukan 200');
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load Track');
      }
    } catch (e) {
      print(e.toString());
      // print('error try driver');
      // return driverData;
      throw Exception('Failed to load Driver');
    } finally {
      isLoadingDriver(false);
    }
  }*/
}

List<TrackingModel> userModelsFromJson(String str) => List<TrackingModel>.from(
    json.decode(str).map((x) => TrackingModel.fromJson(x)));

String userModelsToJson(List<TrackingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrackingModel {
  String? kd_store;
  String? id;
  String? jam_masuk; //bisa dganti Datetime
  String? jam_keluar;

  TrackingModel({
    required this.kd_store,
    required this.id,
    required this.jam_masuk,
    required this.jam_keluar,
  });
// String date = DateFormat("MMM dd, yyyy hh:mm a").format(DateTime.parse("2021-03-20 11:36:00"));
  factory TrackingModel.fromJson(Map<String, dynamic> json) => TrackingModel(
        id: json["id"],
        kd_store: json["kd_store"],
        jam_masuk: json[
            "jam_masuk"], //DateFormat('Hms', 'en_US').parse('14:23:01'), // DateTime.parse(json["jam_masuk"].toString()),//DateFormat.yMMMd().format(DateTime.now()),
        jam_keluar: json["jam_keluar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": kd_store,
        "jam_masuk": jam_masuk,
        "jam_keluar": jam_keluar,
      };
}

/*
List<DriverModel> driverModelsFromJson(String str) => List<DriverModel>.from(
    json.decode(str).map((x) => DriverModel.fromJson(x)));

String driverModelsToJson(List<DriverModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DriverModel {
  String? no_polisi;
  String? nmDriver;

  DriverModel({
    required this.no_polisi,
    required this.nmDriver,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
        nmDriver: json["nama_driver"],
        no_polisi: json["no_pol"],
      );

  Map<String, dynamic> toJson() => {
        "name_driver": nmDriver,
        "no_polisi": no_polisi,
      };
}*/
