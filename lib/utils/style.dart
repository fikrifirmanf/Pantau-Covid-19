import 'package:flutter/material.dart';

class AppStyle {
  static Color bg = Color(0XFF1B244F);
  static Color card = Color(0XFF3C4675);
  static Color confirmed = Colors.yellow[500];
  static Color recovered = Colors.green[500];
  static Color death = Colors.red[500];
  static Color aktif = Colors.orange[500];

  static TextStyle title = TextStyle(fontSize: 24.0, color: Colors.white70);
  static TextStyle txtconfirmed = TextStyle(fontSize: 16.0, color: confirmed);
  static TextStyle txtaktif = TextStyle(fontSize: 16.0, color: aktif);
  static TextStyle txtrecover = TextStyle(fontSize: 16.0, color: recovered);
  static TextStyle txtdeath = TextStyle(fontSize: 16.0, color: death);

  static TextStyle confirmedvalue =
      TextStyle(fontSize: 32.0, color: confirmed, fontWeight: FontWeight.bold);
  static TextStyle recoveredvalue =
      TextStyle(fontSize: 32.0, color: recovered, fontWeight: FontWeight.bold);
  static TextStyle deathvalue =
      TextStyle(fontSize: 32.0, color: death, fontWeight: FontWeight.bold);
  static TextStyle aktifvalue =
      TextStyle(fontSize: 32.0, color: aktif, fontWeight: FontWeight.bold);
}
