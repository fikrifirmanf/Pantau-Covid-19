import 'package:http/http.dart';

class Api {
  final String baseUrl = "https://corona.lmao.ninja/";
  final String kasusIndoUrl =
      "https://louislugas.github.io/covid_19_cluster/json/kasus-corona-indonesia.json";
  Client client = Client();
}
