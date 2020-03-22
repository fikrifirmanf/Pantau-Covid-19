// // To parse this JSON data, do
// //
// //     final countryModel = countryModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;

  CountryModel({
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

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
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

// import 'dart:convert';

// CountryModel countryModelFromJson(String str) =>
//     CountryModel.fromJson(json.decode(str));

// String countryModelToJson(CountryModel data) => json.encode(data.toJson());

// class CountryModel {
//   Confirmed confirmed;
//   Confirmed recovered;
//   Confirmed deaths;
//   DateTime lastUpdate;

//   CountryModel({
//     this.confirmed,
//     this.recovered,
//     this.deaths,
//     this.lastUpdate,
//   });

//   factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
//         confirmed: Confirmed.fromJson(json["confirmed"]),
//         recovered: Confirmed.fromJson(json["recovered"]),
//         deaths: Confirmed.fromJson(json["deaths"]),
//         lastUpdate: DateTime.parse(json["lastUpdate"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "confirmed": confirmed.toJson(),
//         "recovered": recovered.toJson(),
//         "deaths": deaths.toJson(),
//         "lastUpdate": lastUpdate.toIso8601String(),
//       };
// }

// class Confirmed {
//   int value;
//   String detail;

//   Confirmed({
//     this.value,
//     this.detail,
//   });

//   factory Confirmed.fromJson(Map<String, dynamic> json) => Confirmed(
//         value: json["value"],
//         detail: json["detail"],
//       );

//   Map<String, dynamic> toJson() => {
//         "value": value,
//         "detail": detail,
//       };
// }
