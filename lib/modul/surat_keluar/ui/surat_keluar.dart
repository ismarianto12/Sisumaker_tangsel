import 'package:flutter/material.dart';

class SuratKeluar extends StatefulWidget {
  @override
  _SuratKeluarState createState() => _SuratKeluarState();
}

class _SuratKeluarState extends State<SuratKeluar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surat Keluar'),
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(
                'https://p.kindpng.com/picc/s/270-2708235_new-content-coming-soon-web-page-is-under.png'),
            Text('ini adalah halaman surat keluar')
          ],
        ),
      ),
    );
  }
}
