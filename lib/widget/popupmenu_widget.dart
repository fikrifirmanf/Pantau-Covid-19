import 'package:flutter/material.dart';
import 'package:ngeronda_corona/screen/about.dart';
import 'package:ngeronda_corona/utils/constant.dart';
import 'package:ngeronda_corona/utils/style.dart';

class PopUpMenuWidget extends StatelessWidget {
  const PopUpMenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void choicesAct(String choice) {
      switch (choice) {
        case Constants.about:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => AboutPage()));
          break;
        default:
      }
    }

    return PopupMenuButton<String>(
      offset: Offset(50, 50),
      onSelected: choicesAct,
      color: AppStyle.card,
      itemBuilder: (BuildContext context) {
        return Constants.choices.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(
              choice,
              style: TextStyle(color: Colors.white70),
            ),
          );
        }).toList();
      },
    );
  }
}
