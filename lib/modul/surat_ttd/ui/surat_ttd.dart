import 'package:flutter/material.dart';

class SuratTtd extends StatefulWidget {
  @override
  _SuratTtdState createState() => _SuratTtdState();
}

class _SuratTtdState extends State<SuratTtd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tamda tangan surat'),
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(
                'https://p.kindpng.com/picc/s/270-2708235_new-content-coming-soon-web-page-is-under.png'),
            Text('Ini adalah halaman tanda tangan surat')
          ],
        ),
      ),
    );
  }
}
