import 'package:flutter/material.dart';
import 'package:sisumakerv2/src/page/tab_page.dart';

class SuratEksternal extends StatefulWidget {
  @override
  _SuratEksternalState createState() => _SuratEksternalState();
}

class _SuratEksternalState extends State<SuratEksternal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TabPage()),
          );
        },
      ),
      appBar: AppBar(
        title: Text('Surat Eksternal'),
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(
                'https://p.kindpng.com/picc/s/270-2708235_new-content-coming-soon-web-page-is-under.png'),
            Center(child: Text('Surat Belum di baca was here'))
          ],
        ),
      ),
    );
  }
}
