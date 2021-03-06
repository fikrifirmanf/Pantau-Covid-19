import 'package:flutter/material.dart';
import 'package:ngeronda_corona/models/country_model.dart';

import 'package:ngeronda_corona/services/api.dart';

class CountryProv with ChangeNotifier {
  var api = Api();

  CountryModel indo;

  Future<CountryModel> getCountry(String countryId) async {
    final response =
        await api.client.get(api.baseUrl + 'countries/' + countryId);

    if (response.statusCode == 200) {
      notifyListeners();
      var res = countryModelFromJson(response.body);
      indo = res;
      return indo;
    } else {
      return null;
    }
  }
}
