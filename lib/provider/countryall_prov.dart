import 'package:flutter/material.dart';
import 'package:ngeronda_corona/models/countryall_model.dart';
import 'package:ngeronda_corona/services/api.dart';

class CountryAllProv with ChangeNotifier {
  var api = Api();

  List<CountryAllModel> country;

  Future<List<CountryAllModel>> getCountryAll() async {
    final response = await api.client.get('${api.baseUrl}countries');

    if (response.statusCode == 200) {
      notifyListeners();
      var res = countryAllModelFromJson(response.body);
      country = res;
      return country;
    } else {
      return null;
    }
  }
}
