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
  Attributes attributes;

  ProvinsiModel({
    this.attributes,
  });

  factory ProvinsiModel.fromJson(Map<String, dynamic> json) => ProvinsiModel(
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  int fid;
  int kodeProvi;
  String provinsi;
  int kasusPosi;
  int kasusSemb;
  int kasusMeni;

  Attributes({
    this.fid,
    this.kodeProvi,
    this.provinsi,
    this.kasusPosi,
    this.kasusSemb,
    this.kasusMeni,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        fid: json["FID"],
        kodeProvi: json["Kode_Provi"],
        provinsi: json["Provinsi"],
        kasusPosi: json["Kasus_Posi"],
        kasusSemb: json["Kasus_Semb"],
        kasusMeni: json["Kasus_Meni"],
      );

  Map<String, dynamic> toJson() => {
        "FID": fid,
        "Kode_Provi": kodeProvi,
        "Provinsi": provinsi,
        "Kasus_Posi": kasusPosi,
        "Kasus_Semb": kasusSemb,
        "Kasus_Meni": kasusMeni,
      };
}
