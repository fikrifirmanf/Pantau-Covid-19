import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ngeronda_corona/provider/countryall_prov.dart';
import 'package:ngeronda_corona/utils/style.dart';
import 'package:ngeronda_corona/widget/cardnegara_widget.dart';
import 'package:provider/provider.dart';

class AllCountry extends StatefulWidget {
  const AllCountry({Key key}) : super(key: key);

  @override
  _AllCountryState createState() => _AllCountryState();
}

class _AllCountryState extends State<AllCountry> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var country = Provider.of<CountryAllProv>(context).country;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final nf = NumberFormat("#,###");
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Global Detail",
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: AppStyle.bg,
      ),
      backgroundColor: AppStyle.bg,
      body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          height: height,
          width: width,
          child: (country != null)
              ? ListView.builder(
                  itemBuilder: (context, int i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          country[i].country,
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        CardNegara(
                            titleC: 'Terkonfirmasi',
                            titleA: 'Aktif',
                            titleD: 'Meninggal',
                            titleR: 'Sembuh',
                            valueCtoday: country[i]?.todayCases.toString(),
                            valueDtoday: country[i].todayDeaths.toString(),
                            valueC: (country[i]?.cases == null)
                                ? ''
                                : nf.format(country[i]?.cases),
                            valueA: (country[i]?.cases == null)
                                ? ''
                                : nf.format(country[i].cases -
                                        (country[i].recovered +
                                            country[i].deaths) ??
                                    ''),
                            valueR: (country[i]?.recovered == null)
                                ? ''
                                : nf.format(country[i]?.recovered) ?? '',
                            valueD: (country[i]?.deaths == null)
                                ? ''
                                : nf.format(country[i]?.deaths) ?? ''),
                        SizedBox(
                          height: 8.0,
                        ),
                      ],
                    );
                  },
                  itemCount: country.length,
                )
              : Center(
                  child: Text(
                    'Data tidak ditemukan.',
                    style: TextStyle(color: Colors.white70),
                  ),
                )),
    );
  }
}
