import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fomkey = GlobalKey<FormState>();
  final namacontroller = TextEditingController();
  final telephonecontroller = TextEditingController();
  final alamatcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final username = TextEditingController();
  final passwordcontroller = TextEditingController();

  String message = '';

  @override
  void dispose() {
    namacontroller.dispose();
    telephonecontroller.dispose();
    alamatcontroller.dispose();
    emailcontroller.dispose();
    username.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: namacontroller,
              validator: (value) {
                if (value.isEmpty) {
                  return 'nama tidak boleh kosong';
                }
                return null;
              },
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextFormField(
              controller: namacontroller,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Telelphone tidak boleh kosong';
                }
                return null;
              },
              decoration: InputDecoration(labelText: 'Telelphone'),
            ),
            TextFormField(
              controller: namacontroller,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Alamat tidak boleh kosong';
                }
                return null;
              },
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            TextFormField(
              controller: namacontroller,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Email tidak boleh kosong';
                }
                return null;
              },
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: namacontroller,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Username tidak boleh kosong';
                }
                return null;
              },
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              controller: namacontroller,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                return null;
              },
              decoration: InputDecoration(labelText: 'Password'),
            ),
            Padding(
                padding: const EdgeInsets.all(25.0), child: _buildLoginButton())
          ],
        ),
      )),
    );
  }

  Widget _buildLoginButton() {
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
                  Text(
                    "Daftar",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: MediaQuery.of(context).size.height / 40,
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
