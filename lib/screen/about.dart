import 'package:flutter/material.dart';
import 'package:ngeronda_corona/utils/style.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);
  _launchURLFB() async {
    const url = 'https://www.facebook.com/fikrifirmanfadilah';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLGithub() async {
    const url = 'https://github.com/NovelCOVID/API';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLIG() async {
    const url = 'https://www.instagram.com/fikrifirmanf';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLJateng() async {
    const url = 'https://corona.jatengprov.go.id/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang"),
        elevation: 1,
        backgroundColor: AppStyle.bg,
      ),
      backgroundColor: AppStyle.bg,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 32.0,
              horizontal: 32.0,
            ),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    "Pantau Covid-19",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
                Center(
                  child: Divider(
                    thickness: 1,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                Text(
                  "Aplikasi untuk monitoring atau untuk memantau perkembangan kasus virus corona (Covid-19). Data yang disajikan merupakan data valid.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: Text(
                    "Thanks To",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
                Center(
                  child: Divider(
                    thickness: 1,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                GestureDetector(
                  onTap: _launchURLGithub,
                  child: Text(
                    "Data source : https://github.com/NovelCOVID/API",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                SizedBox(height: 16.0),
                GestureDetector(
                  onTap: _launchURLJateng,
                  child: Text(
                    "Data source : https://corona.jatengprov.go.id/",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: Text(
                    "Me",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
                Center(
                  child: Divider(
                    thickness: 1,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                GestureDetector(
                  onTap: _launchURLFB,
                  child: Text(
                    "Facebook : fb.me/fikrifirmanfadilah",
                    style: TextStyle(color: AppStyle.confirmed),
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                GestureDetector(
                  onTap: _launchURLIG,
                  child: Text(
                    "Instagram : instagram.com/fikrifirmanf",
                    style: TextStyle(color: AppStyle.confirmed),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
