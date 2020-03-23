import 'package:flutter/material.dart';
import 'package:ngeronda_corona/provider/analisis_prov.dart';
import 'package:ngeronda_corona/provider/country_prov.dart';
import 'package:ngeronda_corona/provider/countryall_prov.dart';
import 'package:ngeronda_corona/provider/home_prov.dart';
import 'package:ngeronda_corona/provider/kasusindo_prov.dart';
import 'package:ngeronda_corona/provider/provinsi_prov.dart';
import 'package:ngeronda_corona/screen/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProv(),
        ),
        ChangeNotifierProvider(
          create: (_) => CountryProv(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProvinsiProv(),
        ),
        ChangeNotifierProvider(
          create: (_) => AnalisProv(),
        ),
        ChangeNotifierProvider(
          create: (_) => CountryAllProv(),
        ),
        ChangeNotifierProvider(
          create: (_) => KasusIndoProv(),
        )
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pantau Covid-19',
        home: Home());
  }
}
