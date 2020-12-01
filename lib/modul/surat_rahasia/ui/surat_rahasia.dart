import 'package:flutter/material.dart';

class SuratRahasia extends StatefulWidget {
  @override
  _SuratRahasiaState createState() => _SuratRahasiaState();
}

class _SuratRahasiaState extends State<SuratRahasia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Surat Rahasia'),
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(
                'https://p.kindpng.com/picc/s/270-2708235_new-content-coming-soon-web-page-is-under.png'),
            Text('Ini adalah halaman surat rahasia.')
          ],
        ),
      ),
    );
  }
}
