import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ngeronda_corona/provider/provinsi_prov.dart';
import 'package:ngeronda_corona/screen/provinsi_detail.dart';
import 'package:ngeronda_corona/utils/style.dart';
import 'package:ngeronda_corona/widget/cardnegara_widget.dart';
import 'package:provider/provider.dart';

class ProvinsiPage extends StatelessWidget {
  const ProvinsiPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProvinsiProv>(context).prov;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final nf = NumberFormat("#,###");
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Semua Provinsi",
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
          child: (prov != null)
              ? ListView.builder(
                  itemBuilder: (context, int i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          prov[i].attributes.provinsi,
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ProvinsiDetailPage(
                                        prov: prov[i].attributes.provinsi,
                                        urlMap: (prov[i].attributes.provinsi ==
                                                "Jawa Tengah")
                                            ? "https://corona.jatengprov.go.id/home/maps_kabko"
                                            : null,
                                        positif: prov[i]
                                            .attributes
                                            .kasusPosi
                                            .toString(),
                                        dirawat: (prov[i].attributes.kasusPosi -
                                                (prov[i].attributes.kasusSemb +
                                                    prov[i]
                                                        .attributes
                                                        .kasusMeni))
                                            .toString(),
                                        sembuh: prov[i]
                                            .attributes
                                            .kasusSemb
                                            .toString(),
                                        meninggal: prov[i]
                                            .attributes
                                            .kasusMeni
                                            .toString(),
                                      ))),
                          child: CardNegara(
                              titleC: 'Terkonfirmasi',
                              titleA: 'Aktif',
                              titleD: 'Meninggal',
                              titleR: 'Sembuh',
                              valueCtoday: null,
                              valueDtoday: null,
                              valueC: (prov[i]?.attributes?.kasusPosi == null)
                                  ? ''
                                  : nf.format(prov[i]?.attributes?.kasusPosi),
                              valueA: ((prov[i].attributes.kasusPosi -
                                          (prov[i].attributes.kasusSemb +
                                              prov[i].attributes.kasusMeni)) ==
                                      null)
                                  ? ''
                                  : nf.format((prov[i].attributes.kasusPosi -
                                          (prov[i].attributes.kasusSemb +
                                              prov[i].attributes.kasusMeni))) ??
                                      '',
                              valueR: (prov[i]?.attributes?.kasusSemb == null)
                                  ? ''
                                  : nf.format(prov[i]?.attributes?.kasusSemb) ??
                                      '',
                              valueD: (prov[i]?.attributes?.kasusMeni == null)
                                  ? ''
                                  : nf.format(prov[i]?.attributes?.kasusMeni) ??
                                      ''),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                      ],
                    );
                  },
                  itemCount: prov.length,
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
