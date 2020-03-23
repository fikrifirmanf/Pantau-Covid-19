// To parse this JSON data, do
//
//     final provinsiModel = provinsiModelFromJson(jsonString);

import 'dart:convert';

List<ProvinsiModel> provinsiModelFromJson(String str) =>
    List<ProvinsiModel>.from(
        json.decode(str).map((x) => ProvinsiModel.fromJson(x)));

String provinsiModelToJson(List<ProvinsiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProvinsiModel {
  String prov;
  double odp;
  int pdp;
  int positif;
  int dirawat;
  int sembuh;
  int meninggal;

  ProvinsiModel({
    this.prov,
    this.odp,
    this.pdp,
    this.positif,
    this.dirawat,
    this.sembuh,
    this.meninggal,
  });

  factory ProvinsiModel.fromJson(Map<String, dynamic> json) => ProvinsiModel(
        prov: json["prov"],
        odp: json["odp"],
        pdp: json["pdp"],
        positif: json["positif"],
        dirawat: json["dirawat"],
        sembuh: json["sembuh"],
        meninggal: json["meninggal"],
      );

  Map<String, dynamic> toJson() => {
        "prov": prov,
        "odp": odp,
        "pdp": pdp,
        "positif": positif,
        "dirawat": dirawat,
        "sembuh": sembuh,
        "meninggal": meninggal,
      };
}
