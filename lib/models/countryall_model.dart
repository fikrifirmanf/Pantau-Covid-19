// To parse this JSON data, do
//
//     final countryAllModel = countryAllModelFromJson(jsonString);

import 'dart:convert';

List<CountryAllModel> countryAllModelFromJson(String str) =>
    List<CountryAllModel>.from(
        json.decode(str).map((x) => CountryAllModel.fromJson(x)));

String countryAllModelToJson(List<CountryAllModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryAllModel {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;

  CountryAllModel({
    this.country,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
  });

  factory CountryAllModel.fromJson(Map<String, dynamic> json) =>
      CountryAllModel(
        country: json["country"],
        cases: json["cases"],
        todayCases: json["todayCases"],
        deaths: json["deaths"],
        todayDeaths: json["todayDeaths"],
        recovered: json["recovered"],
        active: json["active"],
        critical: json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "cases": cases,
        "todayCases": todayCases,
        "deaths": deaths,
        "todayDeaths": todayDeaths,
        "recovered": recovered,
        "active": active,
        "critical": critical,
        "casesPerOneMillion": casesPerOneMillion,
      };
}
