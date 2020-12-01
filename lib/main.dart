import 'package:flutter/material.dart';
import 'package:sisumakerv2/src/page/splash_page.dart';
import 'package:sisumakerv2/src/routes/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Sisumaker V2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
      onGenerateRoute: RouteGenerator.generate,
    );
  }
}
