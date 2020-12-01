import 'package:flutter/material.dart';

class SudahDibaca extends StatefulWidget {
  @override
  _SudahDibacaState createState() => _SudahDibacaState();
}

class _SudahDibacaState extends State<SudahDibaca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sudah Di Baca'),
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(
                'https://p.kindpng.com/picc/s/270-2708235_new-content-coming-soon-web-page-is-under.png'),
            Text('Halaman Surat Sudah Di Baca .')
          ],
        ),
      ),
    );
  }
}
