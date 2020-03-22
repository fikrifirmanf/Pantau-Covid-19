import 'package:flutter/material.dart';
import 'package:ngeronda_corona/provider/kasusindo_prov.dart';
import 'package:ngeronda_corona/utils/style.dart';
import 'package:provider/provider.dart';

class HistoryIndo extends StatefulWidget {
  HistoryIndo({Key key}) : super(key: key);

  @override
  _HistoryIndoState createState() => _HistoryIndoState();
}

class _HistoryIndoState extends State<HistoryIndo> {
  @override
  Widget build(BuildContext context) {
    var kasusIndo = Provider.of<KasusIndoProv>(context).kasusIndos;
    print(kasusIndo);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Kasus Covid-19 Indonesia",
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: AppStyle.bg,
      ),
      backgroundColor: AppStyle.bg,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: (kasusIndo.nodes != null)
              ? ListView(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  children: kasusIndo.nodes
                      .map((val) => Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 8.0,
                            ),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppStyle.card.withOpacity(0.3)),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 16.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Kasus ' + val.kasus,
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                      ),
                                      Text(val.pengumuman,
                                          style:
                                              TextStyle(color: Colors.white70))
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                          val.gender +
                                              ', ' +
                                              val.umur.toString() +
                                              ' thn',
                                          style:
                                              TextStyle(color: Colors.white70)),
                                      Text(val.status,
                                          style: (val.status == 'Sembuh')
                                              ? TextStyle(
                                                  color: AppStyle.recovered)
                                              : (val.status ==
                                                      'Dalam Perawatan')
                                                  ? TextStyle(
                                                      color: AppStyle.aktif)
                                                  : (val.status == 'Meninggal')
                                                      ? TextStyle(
                                                          color: AppStyle.death)
                                                      : TextStyle(
                                                          color:
                                                              Colors.white70)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(val.penularan,
                                      style:
                                          TextStyle(color: AppStyle.confirmed)),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Provinsi :  ${val.provinsi}',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.local_hospital,
                                        color: Colors.white70,
                                        size: 12.0,
                                      ),
                                      Text(' ' + val.rs,
                                          style:
                                              TextStyle(color: Colors.white70))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                )
              : Center(
                  child: Text('Data tidak ditemukan.'),
                )),
    );
  }
}
