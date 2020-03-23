import 'package:connectivity/connectivity.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:ngeronda_corona/provider/analisis_prov.dart';
import 'package:ngeronda_corona/provider/country_prov.dart';
import 'package:ngeronda_corona/provider/countryall_prov.dart';
import 'package:ngeronda_corona/provider/home_prov.dart';
import 'package:ngeronda_corona/provider/kasusindo_prov.dart';
import 'package:ngeronda_corona/provider/provinsi_prov.dart';
import 'package:ngeronda_corona/screen/all_country.dart';
import 'package:ngeronda_corona/screen/history_indo.dart';
import 'package:ngeronda_corona/screen/provinsi_indo.dart';
import 'package:ngeronda_corona/utils/style.dart';
import 'package:ngeronda_corona/widget/cardnegara_widget.dart';
import 'package:ngeronda_corona/widget/cardtitle_widget.dart';
import 'package:ngeronda_corona/widget/popupmenu_widget.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Geolocator geolocator = Geolocator();
  Position userLoc;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  AndroidDeviceInfo info;
  // DateFormat fn = DateFormat("M-dd-yyyy");
  // String _selectedLocation = "ID";
  // String datetime = '2-18-2020';
  String infoDevice;

  getDevice() async {
    info = await deviceInfo.androidInfo;
  }

  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  postAnalis() async {
    await new Future.delayed(const Duration(seconds: 5));
    Provider.of<AnalisProv>(context, listen: false).createAnalis(
        info.model, info.brand, userLoc.latitude, userLoc.longitude);
  }

  String countryId = "indonesia";
  @override
  void initState() {
    _getLocation().then((position) {
      userLoc = position;
    });

    getDevice();

    // final now = DateTime.now();

    super.initState();
    // setState(() {
    //   datetime = fn.format(DateTime(now.year, now.month, now.day - 1));
    // });
    Provider.of<HomeProv>(context, listen: false).getHomeProv();
    Provider.of<ProvinsiProv>(context, listen: false).getProvinsi();
    Provider.of<CountryProv>(context, listen: false).getCountry(countryId);
    Provider.of<CountryAllProv>(context, listen: false).getCountryAll();
    Provider.of<KasusIndoProv>(context, listen: false).getKasusIndo();
    postAnalis();
  }

  Connectivity _connectivity;
  StreamSubscription<ConnectivityResult> _subscription;

  ConstructorForWhateverClassThisIs() {
    _connectivity = new Connectivity();
    _subscription =
        _connectivity.onConnectivityChanged.listen(onConnectivityChange);
  }

  void onConnectivityChange(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      _scaffoldKey.currentState.showSnackBar(
          new SnackBar(content: new Text("No internet connection")));
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat("#,###");

    var home = Provider.of<HomeProv>(context).home;
    var indo = Provider.of<CountryProv>(context).indo;

    //print(home.deaths / (home.recovered + home.deaths) * 100);
    //print(indo);

    DateFormat df = DateFormat("dd-MM-yyyy HH:mm:ss");

    Future<void> _handleRefresh() {
      final Completer<void> completer = Completer<void>();
      if (Provider.of<HomeProv>(context, listen: false).getHomeProv() != null) {
        completer.complete();
      }
      return completer.future.then<void>((_) {
        Provider.of<HomeProv>(context, listen: false).getHomeProv();
        Provider.of<CountryProv>(context, listen: false).getCountry(countryId);
        Provider.of<CountryAllProv>(context, listen: false).getCountryAll();
        Provider.of<KasusIndoProv>(context, listen: false).getKasusIndo();
        Provider.of<ProvinsiProv>(context, listen: false).getProvinsi();
        _scaffoldKey.currentState?.showSnackBar(SnackBar(
            content: const Text(
              'Refresh complete',
              style: TextStyle(color: Colors.white),
            ),
            action: SnackBarAction(
                label: 'RETRY',
                onPressed: () {
                  _refreshIndicatorKey.currentState.show();
                })));
      });
    }

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppStyle.bg,
        appBar: AppBar(
          actions: <Widget>[PopUpMenuWidget()],
          elevation: 1,
          backgroundColor: AppStyle.bg,
          title: Text(
            "Pantau Covid-19",
            style: TextStyle(color: Colors.white70),
          ),
        ),
        body: SafeArea(
          top: false,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: (home == null)
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.yellow[500],
                    ),
                  )
                : LiquidPullToRefresh(
                    key: _refreshIndicatorKey,
                    onRefresh: _handleRefresh,
                    color: AppStyle.card,
                    showChildOpacityTransition: false,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white10),
                              child: Text(
                                "Update " +
                                    df.format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                      home.updated,
                                      isUtc: false,
                                    )),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            // IconButton(
                            //   color: Colors.white54,
                            //   icon: Icon(Icons.refresh),
                            //   onPressed: () {
                            //     setState(() {
                            //       Provider.of<HomeProv>(context, listen: false)
                            //           .getHomeProv();
                            //       Provider.of<CountryProv>(context,
                            //               listen: false)
                            //           .getCountry(countryId);
                            //     });
                            //   },
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        // RaisedButton(
                        //   onPressed: () {
                        //     print(userLoc.latitude);
                        //   },
                        //   child: Text('test'),
                        // ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Global",
                              style: AppStyle.title,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AllCountry())),
                              child: Text(
                                'Lihat detail',
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 16.0,
                        ),
                        CardTitle(
                          stat: '',
                          styleOrang: TextStyle(color: Colors.yellow[500]),
                          title: 'Terkonfirmasi',
                          styleTitle: AppStyle.txtconfirmed,
                          styleValue: AppStyle.confirmedvalue,
                          value: nf.format(home?.cases) ?? '',
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        CardTitle(
                          stat: '',
                          styleOrang: TextStyle(color: Colors.orange[500]),
                          title: 'Aktif',
                          styleTitle: AppStyle.txtaktif,
                          styleValue: AppStyle.aktifvalue,
                          value: nf.format(home.cases -
                                  (home.recovered + home.deaths)) ??
                              '',
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        CardTitle(
                          stat: ((home.recovered /
                                      (home.recovered + home.deaths) *
                                      100)
                                  .isNaN)
                              ? '-%'
                              : (home.recovered /
                                          (home.recovered + home.deaths) *
                                          100)
                                      .round()
                                      .toString() +
                                  '%',
                          styleOrang: TextStyle(color: Colors.green[500]),
                          title: 'Sembuh',
                          styleTitle: AppStyle.txtrecover,
                          styleValue: AppStyle.recoveredvalue,
                          value: nf.format(home?.recovered) ?? '',
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        CardTitle(
                          stat: ((home.deaths /
                                      (home.recovered + home.deaths) *
                                      100)
                                  .isNaN)
                              ? '-%'
                              : (home.deaths /
                                          (home.recovered + home.deaths) *
                                          100)
                                      .round()
                                      .toString() +
                                  '%',
                          styleOrang: TextStyle(color: Colors.red[500]),
                          title: 'Meninggal',
                          styleTitle: AppStyle.txtdeath,
                          styleValue: AppStyle.deathvalue,
                          value: nf.format(home?.deaths) ?? '',
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              indo?.country ?? "Negara",
                              style: AppStyle.title,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ProvinsiPage())),
                              child: Text(
                                'Lihat provinsi',
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HistoryIndo())),
                          child: CardNegara(
                              titleC: 'Terkonfirmasi',
                              titleA: 'Aktif',
                              titleD: 'Meninggal',
                              titleR: 'Sembuh',
                              valueCtoday: indo?.todayCases?.toString() ?? '0',
                              valueDtoday: indo?.todayDeaths?.toString() ?? '0',
                              valueC: (indo?.cases == null)
                                  ? ''
                                  : nf.format(indo?.cases),
                              valueA: (indo?.cases == null)
                                  ? ''
                                  : nf.format(indo.cases -
                                          (indo.recovered + indo.deaths) ??
                                      ''),
                              valueR: (indo?.recovered == null)
                                  ? ''
                                  : nf.format(indo?.recovered) ?? '',
                              valueD: (indo?.deaths == null)
                                  ? ''
                                  : nf.format(indo?.deaths) ?? ''),
                        ),
                        SizedBox(
                          height: 32.0,
                        )
                      ],
                    ),
                  ),
          ),
        ));
  }
}
