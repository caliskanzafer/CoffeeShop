import 'dart:convert';
import 'dart:io';
import 'package:coffee_shop/core/model/siparis.dart';
import 'package:coffee_shop/core/model/urun.dart';
import 'package:http/http.dart' as http;

class UrunService {
  static const String FIREBASE_URL =
      'https://cafeapp-for-django.herokuapp.com/api/urunler';

  Future<List<Urun>> getTask() async {
    final taskList = <Urun>[];
    final response = await http
        .get(Uri.https('cafeapp-for-django.herokuapp.com', 'api/urunler'));
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonModel = json.decode(response.body) as List;
        jsonModel.forEach((element) {
          var taskModel = Urun.fromJson(element);
          taskList.add(taskModel);
        });
        return taskList;
      default:
        return Future.error(response.statusCode);
    }
  }

  Future<List<Siparis>> getSiparis() async {
    final taskList = <Siparis>[];
    final response = await http
        .get(Uri.https('cafeapp-for-django.herokuapp.com', 'api/siparisler'));
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonModel = json.decode(response.body) as List;
        jsonModel.forEach((element) {
          var taskModel = Siparis.fromJson(element);
          taskList.add(taskModel);
        });
        return taskList;
      default:
        return Future.error(response.statusCode);
    }
  }

  Future<bool> addTask(Urun urun) async {
    final response = await http.post(
      Uri.https('cafeapp-for-django.herokuapp.com', 'api/siparisler'),
      body: json.encode({
        'adet': 1,
        'toplam_fiyat': urun.fiyat,
        'urun': urun.id,
      }),
    );
    print(response.statusCode);
    switch (response.statusCode) {
      case HttpStatus.ok:
        return true;
      default:
        return false;
    }
  }
}
