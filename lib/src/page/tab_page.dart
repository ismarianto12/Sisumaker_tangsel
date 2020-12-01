import 'package:flutter/material.dart';
import 'package:sisumakerv2/modul/kirim_surat/ui/kirim_surat.dart';
import 'package:sisumakerv2/modul/surat_keluar/ui/surat_keluar.dart';
import 'package:sisumakerv2/src/page/home_page.dart';
import 'package:sisumakerv2/src/page/profile_page.dart';

class TabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Tab();
  }
}

class _Tab extends StatefulWidget {
  @override
  __TabState createState() => __TabState();
}

class __TabState extends State<_Tab> {
  int _curentIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    KirimSurat(),
    SuratKeluar(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_curentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _curentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            title: Text(
              'KirimSurat',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text(
              'Surat keluar',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text(
              'Profile',
            ),
          ),
        ],
        onTap: (value) {
          setState(() {
            _curentIndex = value;
          });
        },
      ),
    );
  }
}
