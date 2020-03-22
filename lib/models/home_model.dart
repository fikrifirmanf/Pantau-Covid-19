// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  int cases;
  int deaths;
  int recovered;
  int updated;

  HomeModel({
    this.cases,
    this.deaths,
    this.recovered,
    this.updated,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        cases: json["cases"],
        deaths: json["deaths"],
        recovered: json["recovered"],
        updated: json["updated"],
      );

  Map<String, dynamic> toJson() => {
        "cases": cases,
        "deaths": deaths,
        "recovered": recovered,
        "updated": updated,
      };
}

// // To parse this JSON data, do
// //
// //     final homeModel = homeModelFromJson(jsonString);

// import 'dart:convert';

// HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

// String homeModelToJson(HomeModel data) => json.encode(data.toJson());

// class HomeModel {
//   Confirmed confirmed;
//   Confirmed recovered;
//   Confirmed deaths;
//   String dailySummary;
//   CountryDetail dailyTimeSeries;
//   String image;
//   String source;
//   String countries;
//   CountryDetail countryDetail;
//   DateTime lastUpdate;

//   HomeModel({
//     this.confirmed,
//     this.recovered,
//     this.deaths,
//     this.dailySummary,
//     this.dailyTimeSeries,
//     this.image,
//     this.source,
//     this.countries,
//     this.countryDetail,
//     this.lastUpdate,
//   });

//   factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
//         confirmed: Confirmed.fromJson(json["confirmed"]),
//         recovered: Confirmed.fromJson(json["recovered"]),
//         deaths: Confirmed.fromJson(json["deaths"]),
//         dailySummary: json["dailySummary"],
//         dailyTimeSeries: CountryDetail.fromJson(json["dailyTimeSeries"]),
//         image: json["image"],
//         source: json["source"],
//         countries: json["countries"],
//         countryDetail: CountryDetail.fromJson(json["countryDetail"]),
//         lastUpdate: DateTime.parse(json["lastUpdate"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "confirmed": confirmed.toJson(),
//         "recovered": recovered.toJson(),
//         "deaths": deaths.toJson(),
//         "dailySummary": dailySummary,
//         "dailyTimeSeries": dailyTimeSeries.toJson(),
//         "image": image,
//         "source": source,
//         "countries": countries,
//         "countryDetail": countryDetail.toJson(),
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

// class CountryDetail {
//   String pattern;
//   String example;

//   CountryDetail({
//     this.pattern,
//     this.example,
//   });

//   factory CountryDetail.fromJson(Map<String, dynamic> json) => CountryDetail(
//         pattern: json["pattern"],
//         example: json["example"],
//       );

//   Map<String, dynamic> toJson() => {
//         "pattern": pattern,
//         "example": example,
//       };
// }
