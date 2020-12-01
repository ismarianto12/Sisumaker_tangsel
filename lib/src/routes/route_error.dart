import 'package:flutter/material.dart';
import 'package:sisumakerv2/src/page/home_page.dart';
import 'package:sisumakerv2/src/page/tab_page.dart';

class ErrorRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Error'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Image.network(
                'https://img.freepik.com/free-vector/error-404-concept-landing-page_52683-18367.jpg?size=626&ext=jpg'),
            Divider(),
            Center(
              child: Text(
                'Halaman tidak Di Temukan',
                style: TextStyle(
                    color: Colors.black, letterSpacing: 1.5, fontSize: 25.0),
              ),
            ),
            Center(child: _buildbutton(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildbutton(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30.0,
            width: 250.0,
            margin: EdgeInsets.only(bottom: 20),
            child: RaisedButton(
              elevation: 5.0,
              color: Colors.blue[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabPage()),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                  Text(
                    "Kembali Ke Home",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: MediaQuery.of(context).size.height / 40,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
