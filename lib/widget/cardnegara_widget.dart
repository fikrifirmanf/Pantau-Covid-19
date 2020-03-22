import 'package:flutter/material.dart';
import 'package:ngeronda_corona/utils/style.dart';

class CardNegara extends StatelessWidget {
  String titleC,
      titleA,
      titleR,
      titleD,
      valueC,
      valueCtoday,
      valueA,
      valueR,
      valueD,
      valueDtoday;

  CardNegara({
    this.titleC,
    this.titleA,
    this.titleR,
    this.titleD,
    this.valueC,
    this.valueCtoday,
    this.valueDtoday,
    this.valueA,
    this.valueR,
    this.valueD,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppStyle.card.withOpacity(0.3)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    titleC,
                    style: TextStyle(color: AppStyle.confirmed),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    valueC,
                    style: TextStyle(color: AppStyle.confirmed),
                  ),
                  Text(
                    '(' + valueCtoday + ' hari ini)',
                    style: TextStyle(color: AppStyle.confirmed, fontSize: 12),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    titleA,
                    style: TextStyle(color: AppStyle.aktif),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    valueA,
                    style: TextStyle(color: AppStyle.aktif),
                  ),
                  // Text(
                  //   'orang',
                  //   style: TextStyle(color: AppStyle.aktif),
                  // )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    titleR,
                    style: TextStyle(color: AppStyle.recovered),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    valueR,
                    style: TextStyle(color: AppStyle.recovered),
                  ),
                  // Text(
                  //   'orang',
                  //   style: TextStyle(color: AppStyle.recovered),
                  // )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    titleD,
                    style: TextStyle(color: AppStyle.death),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    valueD,
                    style: TextStyle(color: AppStyle.death),
                  ),
                  Text(
                    '(' + valueDtoday + ' hari ini)',
                    style: TextStyle(color: AppStyle.death, fontSize: 12),
                  ),
                  // Text(
                  //   'orang',
                  //   style: TextStyle(color: AppStyle.death),
                  // )
                ],
              ),
            ),
          ],
        ));
  }
}
