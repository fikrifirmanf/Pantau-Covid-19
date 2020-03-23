import 'package:flutter/material.dart';
import 'package:ngeronda_corona/models/provinsi_model.dart';
import 'package:ngeronda_corona/services/api.dart';

class ProvinsiProv with ChangeNotifier {
  List<ProvinsiModel> prov;
  var api = Api();

  Future<List<ProvinsiModel>> getProvinsi() async {
    final response = await api.client.get(api.provIndoUrl);

    if (response.statusCode == 200) {
      notifyListeners();
      var res = provinsiModelFromJson(response.body);
      prov = res;
      return prov;
    } else {
      return null;
    }
  }
}
