import 'package:flutter/material.dart';

class SuratInternal extends StatefulWidget {
  @override
  _SuratInternalState createState() => _SuratInternalState();
}

class _SuratInternalState extends State<SuratInternal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Surat Internal'),
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(
                'https://p.kindpng.com/picc/s/270-2708235_new-content-coming-soon-web-page-is-under.png'),
            Text('Ini adalah halaman surat internal.')
          ],
        ),
      ),
    );
  }
}
