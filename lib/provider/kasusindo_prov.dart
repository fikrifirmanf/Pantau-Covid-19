import 'package:flutter/material.dart';
import 'package:ngeronda_corona/models/kasusindo_model.dart';
import 'package:ngeronda_corona/services/api.dart';

class KasusIndoProv with ChangeNotifier {
  var api = Api();
  KasusIndoModel kasusIndos;

  Future<KasusIndoModel> getKasusIndo() async {
    final response = await api.client.get(api.kasusIndoUrl);

    if (response.statusCode == 200) {
      notifyListeners();
      var res = kasusIndoModelFromJson(response.body);
      kasusIndos = res;
      return kasusIndos;
    } else {
      return null;
    }
  }
}
