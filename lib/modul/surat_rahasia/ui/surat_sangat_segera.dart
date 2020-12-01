import 'package:flutter/material.dart';

class SangatSegera extends StatefulWidget {
  @override
  _SangatSegeraState createState() => _SangatSegeraState();
}

class _SangatSegeraState extends State<SangatSegera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sgangat Segera'),
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(
                'https://p.kindpng.com/picc/s/270-2708235_new-content-coming-soon-web-page-is-under.png'),
            Text('Ini adalha halama surat sangat segera')
          ],
        ),
      ),
    );
  }
}
