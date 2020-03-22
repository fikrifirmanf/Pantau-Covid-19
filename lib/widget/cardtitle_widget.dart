import 'package:flutter/material.dart';
import 'package:ngeronda_corona/utils/style.dart';

class CardTitle extends StatelessWidget {
  String title, value, stat;
  TextStyle styleTitle, styleOrang, styleValue;
  CardTitle(
      {this.title,
      this.value,
      this.stat,
      this.styleTitle,
      this.styleOrang,
      this.styleValue});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 6,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppStyle.card.withOpacity(0.3)),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: styleTitle,
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  value,
                  style: styleValue,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  stat,
                  style: styleOrang,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
