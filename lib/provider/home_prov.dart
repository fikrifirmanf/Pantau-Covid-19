import 'package:flutter/material.dart';
import 'package:ngeronda_corona/models/home_model.dart';
import 'package:ngeronda_corona/services/api.dart';

class HomeProv with ChangeNotifier {
  var api = Api();

  HomeModel home;

  Future<HomeModel> getHomeProv() async {
    final response = await api.client.get(api.baseUrl + "all");

    if (response.statusCode == 200) {
      notifyListeners();
      var res = homeModelFromJson(response.body);
      home = res;
      return home;
    } else {
      return null;
    }
  }
}
