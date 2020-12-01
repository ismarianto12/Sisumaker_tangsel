import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sisumakerv2/src/bloc/bloc.dart';
import 'package:sisumakerv2/src/page/register_page.dart';
import 'package:sisumakerv2/src/utils/widget.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
      ),
      body: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(),
        child: _Login(),
      ),
    );
  }
}

class _Login extends StatefulWidget {
  @override
  __LoginState createState() => __LoginState();
}

// https://sisumaker.tangerangselatankota.go.id/surattangsel20/api/auth

class __LoginState extends State<_Login> {
  AuthValidate _authValidate = AuthValidate();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _year;

// void dispose()
// {
//   __accesstoregister.dispose();
// }

// void initState(){
//   super.initState();
//   __accesstoregister = GestureDetector(){

//   };
// }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSucces) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/TabPage',
            (route) => false,
          );
        } else if (state is AuthError) {
          showDialog(
            context: context,
            child: WidgetAlertDialog(
              title: 'Error',
              subtitle: state.responseModel.messages,
            ),
          );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/icon/icon.png',
              color: Colors.grey,
              filterQuality: FilterQuality.medium,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Username
                  StreamBuilder<String>(
                    stream: _authValidate.streamUsername,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _usernameController,
                          onChanged: _authValidate.onchangeUsername,
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Ubuntu',
                            ),
                            labelText: 'Username',
                            errorText: snapshot.error,
                            prefixIcon: Icon(
                              Icons.supervised_user_circle,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // Password
                  StreamBuilder<String>(
                    stream: _authValidate.streamPassword,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _passwordController,
                          onChanged: _authValidate.onchangePassword,
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Ubuntu',
                            ),
                            labelText: 'Password',
                            errorText: snapshot.error,
                            prefixIcon: Icon(
                              Icons.vpn_key,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // Year
                  StreamBuilder<String>(
                    stream: _authValidate.streamYear,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField<String>(
                          value: snapshot.data,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Ubuntu',
                            ),
                            labelText: 'Tahun',
                            errorText: snapshot.error,
                            prefixIcon: Icon(
                              Icons.date_range,
                            ),
                          ),
                          items: [
                            DropdownMenuItem(
                              child: Text('2018'),
                              value: '2018',
                            ),
                            DropdownMenuItem(
                              child: Text('2019'),
                              value: '2019',
                            ),
                            DropdownMenuItem(
                              child: Text('2020'),
                              value: '2020',
                            ),
                          ],
                          onChanged: (value) {
                            _authValidate.steramSinkYear.add(value);
                            setState(() {
                              _year = value;
                            });
                          },
                        ),
                      );
                    },
                  ),

                  // Keterangan
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Belum punya akun sisumaker ? ',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          TextSpan(
                            text: 'Register disini.',
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Action Button
                  StreamBuilder<bool>(
                    stream: _authValidate.submitLogin,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is AuthLoading) {
                              return WidgetSubmitButton(
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.red,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return WidgetSubmitButton(
                                child: snapshot.hasData
                                    ? Ink(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.red,
                                              Colors.redAccent
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10.0,
                                          ),
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Login',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Text('Login'),
                                buttonColor: Colors.white,
                                onPressed: snapshot.hasData
                                    ? () {
                                        BlocProvider.of<AuthBloc>(context).add(
                                          Login(
                                            data: {
                                              'username':
                                                  _usernameController.text,
                                              'password':
                                                  _passwordController.text,
                                            },
                                            year: _year,
                                          ),
                                        );
                                      }
                                    : null,
                              );
                            }
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
