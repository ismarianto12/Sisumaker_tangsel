import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sisumakerv2/src/utils/common.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Storage.getStorage('token').then(
      (token) => {
        if (token.isNotEmpty)
          {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/TabPage',
              (route) => false,
            ),
          }
        else
          {
            Timer.periodic(Duration(seconds: 5), (timer) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/CekDomainPage',
                (route) => false,
              );
              timer.cancel();
            }),
          }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // Widget Perusahaan
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "From",
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        'Diskominfo Kota Tangerang Selatan',
                      ),
                    ],
                  ),
                )
              ],
            ),

            // Widget Logo & Nama Perusahan
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset(
                  'lib/assets/icon/icon_2.png',
                  height: 180,
                  filterQuality: FilterQuality.high,
                ),
                Text(
                  'Sisumaker',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
