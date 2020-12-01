import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sisumakerv2/modul/surat_masuk/bloc/surat_masuk_bloc.dart';
import 'package:sisumakerv2/modul/surat_masuk/ui/surat_masuk_detail.dart';
// import 'package:sisumakerv2/src/page/tab_page.dart';

class WidgetSuratMasuk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 1,
        elevation: 1,
        leading: Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: IconButton(
            color: Colors.green,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context, true),
          ),
        ),
        title: Text('Data Surat Masuk', style: TextStyle(color: Colors.white)),

        actions: [
          Icon(Icons.search, color: Colors.white),
        ], // iconTheme: ,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
          '/TabPage',
          (route) => false,
        ),
      ),
      body: BlocProvider<SuratMasukBloc>(
        create: (context) => SuratMasukBloc()..add(Suratmasuk()),
        child: _SuratMasukpage(),
      ),
    );
  }
}

class _SuratMasukpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuratMasukBloc, SuratMasukState>(
      builder: (context, state) {
        print(state);
        if (state is SuratmasukinLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SuratmasukSucces) {
          return _SuratMasuk(state: state);
        } else {
          return Container();
        }
      },
    );
  }
}

class _SuratMasuk extends StatefulWidget {
  final SuratmasukSucces state;

  _SuratMasuk({this.state});

  @override
  _SuratMasukState createState() => _SuratMasukState();
}

class _SuratMasukState extends State<_SuratMasuk> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.state.suratMasukModel.data.length,
        itemBuilder: (context, int i) {
          final suratMasukData = widget.state.suratMasukModel.data[i];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () => SuratMasukDetail(suratMasukData),
                selectedTileColor: Colors.red,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://sisumaker.tangerangselatankota.go.id/assets/header_login.png'),
                ),
                title: Text(widget.state.suratMasukModel.data[i].asalSurat),
                subtitle: Text('Tanggal Surat :' +
                    widget.state.suratMasukModel.data[i].tglDikirim),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _cardlist() {
    Container(
      child: Text(
        'This is a Container',
        textScaleFactor: 2,
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.green, spreadRadius: 3),
        ],
      ),
      height: 50,
    );
  }
}
