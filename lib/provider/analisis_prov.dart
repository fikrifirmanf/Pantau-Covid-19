import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnalisProv with ChangeNotifier {
  Future<http.Response> createAnalis(
      String model, String brand, double lat, double long) async {
    return http.post('http://prmkarangtawang.org/api_covid/api.php', headers: {
      "Accept": "application/json",
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      'model': model,
      'brand': brand,
      'lat': lat.toString(),
      'long': long.toString(),
    });
  }

  notifyListeners();
}
