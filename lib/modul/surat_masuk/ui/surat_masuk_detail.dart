import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sisumakerv2/modul/surat_masuk/bloc/surat_masuk_bloc.dart';

class SuratMasukDetail extends StatelessWidget {
  final dats;
  SuratMasukDetail(this.dats);

  @override
  Widget build(BuildContext context) {
    // print(datams);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Surat'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                title: Text(dats),
                leading: Icon(Icons.label_important_outline_rounded),
              ),
            ),
            Card(
              child: ListTile(
                  leading: Text('File Surat'),
                  title: _downloadfile(context, 'Download Surat',
                      Icon(Icons.download_done_sharp))),
            ),
          ],
        ),
      ),
    );
  }

// tombol data
  Widget _downloadfile(BuildContext context, String title, icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 1.4 * (MediaQuery.of(context).size.height / 20),
            width: 6 * (MediaQuery.of(context).size.width / 10),
            margin: EdgeInsets.only(bottom: 20),
            child: RaisedButton(
              elevation: 5.0,
              color: Colors.blue[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () async {},
              child: Row(
                children: [
                  icon,
                  Center(
                    child: Text(
                      "$title",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: MediaQuery.of(context).size.height / 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
