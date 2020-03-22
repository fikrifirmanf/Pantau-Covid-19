import 'package:flutter/material.dart';
import 'package:ngeronda_corona/screen/all_country.dart';
import 'package:ngeronda_corona/screen/home.dart';
import 'package:ngeronda_corona/utils/style.dart';

class BottomBarWidget extends StatefulWidget {
  BottomBarWidget({Key key}) : super(key: key);

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int _currentIndex = 0;
  final List<Widget> screens = [Home(), AllCountry()];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          backgroundColor: AppStyle.card.withOpacity(0.5),
          selectedItemColor: Colors.yellow[500],
          unselectedItemColor: Colors.white70,
          elevation: 1,

          currentIndex:
              _currentIndex, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.flag),
              title: new Text('Negara'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.info), title: Text('Berita'))
          ],
        ),
        backgroundColor: AppStyle.bg,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.white70,
              ),
            )
          ],
          elevation: 1,
          backgroundColor: AppStyle.bg,
          title: Text(
            "Pantau Covid-19",
            style: TextStyle(color: Colors.white70),
          ),
        ),
        body: screens[_currentIndex]);
  }
}
