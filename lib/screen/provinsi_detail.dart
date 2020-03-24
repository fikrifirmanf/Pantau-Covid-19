import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ngeronda_corona/utils/style.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProvinsiDetailPage extends StatefulWidget {
  String prov, positif, urlMap, dirawat, sembuh, meninggal;
  ProvinsiDetailPage(
      {this.prov,
      this.positif,
      this.dirawat,
      this.urlMap,
      this.meninggal,
      this.sembuh});
  @override
  _ProvinsiDetailPageState createState() => _ProvinsiDetailPageState();
}

class _ProvinsiDetailPageState extends State<ProvinsiDetailPage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          widget?.prov ?? "Detail",
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: AppStyle.bg,
      ),
      backgroundColor: AppStyle.bg,
      body: Container(
        child: ListView(children: [
          (widget.urlMap != null)
              ? Container(
                  height: height / 2.3,
                  width: width,
                  child: WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: widget.urlMap,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    },
                  ))
              : SizedBox.shrink(),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Terkonfirmasi",
                  style: TextStyle(
                      color: Colors.yellow[500],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget?.positif ?? "-",
                  style: TextStyle(
                      color: Colors.yellow[500],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Aktif",
                  style: TextStyle(
                      color: Colors.orange[500],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget?.dirawat ?? "-",
                  style: TextStyle(
                      color: Colors.orange[500],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Sembuh",
                  style: TextStyle(
                      color: Colors.green[500],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget?.sembuh ?? "-",
                  style: TextStyle(
                      color: Colors.green[500],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Meninggal",
                  style: TextStyle(
                      color: Colors.red[500],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget?.meninggal ?? "-",
                  style: TextStyle(
                      color: Colors.red[500],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
