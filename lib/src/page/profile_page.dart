import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sisumakerv2/src/bloc/profile/profile_bloc.dart';

import 'package:sisumakerv2/src/utils/common.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 0.0,
        bottomOpacity: 0.0,
        title: Text(
          'Edit Profil User',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Icon(
            Icons.logout,
            color: Colors.black,
          ),
        ],
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context, true),
          ),
        ),
      ),
      body: BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(),
        child: Container(child: FormProfil()),
      ),
    );
  }
// logout function
}

class FormProfil extends StatefulWidget {
  @override
  __FormProfilState createState() => __FormProfilState();
}

class __FormProfilState extends State<FormProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://i.pinimg.com/originals/b9/c8/f8/b9c8f893c9a782033a01f47e0c0b1d6e.jpg"),
          fit: BoxFit.cover,
        ),
        // gradient: LinearGradient(
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomLeft,
        //     colors: [Colors.blue, Colors.green, Colors.red])
      ),
      margin: const EdgeInsets.only(top: 10.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _photo(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        title: Text('Edit Profil user',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            )),
                        leading: Icon(Icons.verified_user),
                      ),
                      _nama(),
                      _nip(),
                      _noTelp()
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Konfirmasi Password'),
                        leading: Icon(Icons.verified_user),
                      ),
                      _password(),
                    ],
                  ),
                ),
              ),
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Edit Domain'),
                      leading: Icon(Icons.verified_user),
                    ),
                    _editdomain(),
                  ],
                ),
              )),
              _savebtn(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _photo() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 80.0,
        backgroundColor: const Color(0xFF778899),
        backgroundImage:
            NetworkImage("https://www.woolha.com/media/2020/03/eevee.png"),
      ),
    ));
  }

  Widget _nama() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        //initialValue: 'Nama User',
        decoration: InputDecoration(
          labelText: 'Nama',
          border: OutlineInputBorder(),
          suffixIcon: Icon(
            Icons.supervised_user_circle,
          ),
        ),
      ),
    );
  }

  Widget _nip() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        //initialValue: 'Nip Pegawai User',
        decoration: InputDecoration(
          labelText: 'Nip Pegawai',
          border: OutlineInputBorder(),
          suffixIcon: Icon(
            Icons.supervised_user_circle,
          ),
        ),
      ),
    );
  }

  Widget _noTelp() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        //initialValue: 'Nomor telephone',
        decoration: InputDecoration(
          labelText: 'Telephone',
          border: OutlineInputBorder(),
          suffixIcon: Icon(
            Icons.supervised_user_circle,
          ),
        ),
      ),
    );
  }

  Widget _password() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        //initialValue: 'Password',
        decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(),
          suffixIcon: Icon(
            Icons.vpn_key,
          ),
        ),
      ),
    );
  }

  Widget _editdomain() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        //initialValue: 'Ubah domain',
        decoration: InputDecoration(
          labelText: 'Ubah domain',
          border: OutlineInputBorder(),
          suffixIcon: Icon(
            Icons.vpn_key,
          ),
        ),
      ),
    );
  }

  Widget _savebtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 1.4 * (MediaQuery.of(context).size.height / 20),
            width: 5 * (MediaQuery.of(context).size.width / 10),
            margin: EdgeInsets.only(bottom: 20),
            child: RaisedButton(
              elevation: 5.0,
              color: Colors.blue[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () async {
                // if (_formkey.currentState.validate()) {
                //   var username = usernameController.text;
                //   var password = passwordController.text;

                //   setState(() {
                //     message = 'Sedang Memproses ...';
                //   });
                //   var resp = await loginUser(username, password);
                //   // print(resp);
                //   if (resp['status'] == 1) {
                //     SharedPreferences prefs =
                //         await SharedPreferences.getInstance();
                //     prefs.setString("username", username);
                //     prefs.setString("userid", resp['userid']);
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => Depan()),
                //     );
                //     setState(() {
                //       message = 'Login Berhasil Mohon Tunggu ..';
                //     });
                //   } else {
                //     setState(() {
                //       message = 'Username dan password salah';
                //     });
                //   }
                // }
              },
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                  Center(
                    child: Text(
                      "Simpan",
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

// if confirm logout
// showDialog(
//               barrierDismissible: true,
//               context: context,
//               builder: (BuildContext context) {
//                 return WidgetDialog(
//                   title: 'Peringatan',
//                   subtitle: 'Apakah Anda Yakin Akan Keluar Dari Aplikasi Ini ?',
//                   buttonText: 'Keluar',
//                   buttonColors: Colors.red,
//                   statusCode: null,
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => OtpPage(),
//                       ),
//                     );
