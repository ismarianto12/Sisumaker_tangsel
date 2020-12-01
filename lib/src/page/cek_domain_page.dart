import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sisumakerv2/src/bloc/bloc.dart';
import 'package:sisumakerv2/src/utils/widget.dart';

class CekDomainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<CekDomainBloc>(
        create: (context) => CekDomainBloc(),
        child: _CekDomain(),
      ),
    );
  }
}

class _CekDomain extends StatefulWidget {
  @override
  __CekDomainState createState() => __CekDomainState();
}

class __CekDomainState extends State<_CekDomain> {
  CekDomainValidate _cekDomainValidate = CekDomainValidate();
  TextEditingController _domainController = TextEditingController();

  @override
  Widget build(context) {
    final _size = MediaQuery.of(context).size;

    return BlocListener<CekDomainBloc, CekDomainState>(
      listener: (context, state) {
        if (state is CekDomainSucces) {
          Navigator.pushNamed(context, '/LoginPage');
        } else if (state is CekDomainError) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WidgetAlertDialog(
                onWillPop: false,
                title: 'Error',
                subtitle: state.responseModel.messages,
              );
            },
          );
        }
      },
      child: SingleChildScrollView(
        child: Container(
          height: _size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'lib/assets/img/cek_domain.jpg',
                height: _size.height * 0.5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        StreamBuilder<String>(
                          stream: _cekDomainValidate.streamDomain,
                          builder: (context, snapshot) {
                            return TextField(
                              controller: _domainController,
                              onChanged: _cekDomainValidate.onchangeDomain,
                              decoration: InputDecoration(
                                labelText: 'Domain',
                                hintText:
                                    'Ex : sisumaker.tangerangselatankota.go.id',
                                errorText: snapshot.error,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            );
                          },
                        ),
                        StreamBuilder<bool>(
                          stream: _cekDomainValidate.cekDomain,
                          builder: (context, snapshot) {
                            return BlocBuilder<CekDomainBloc, CekDomainState>(
                              builder: (context, state) {
                                if (state is CekDomainLoading) {
                                  return WidgetSubmitButton(
                                    child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
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
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10.0,
                                              ),
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Cek',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Text('Cek'),
                                    buttonColor: Colors.white,
                                    onPressed: snapshot.hasData
                                        ? () {
                                            BlocProvider.of<CekDomainBloc>(
                                                    context)
                                                .add(
                                              CekDomain(
                                                domain: _domainController.text,
                                              ),
                                            );
                                            FocusScope.of(context).unfocus();
                                          }
                                        : null,
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Text(
                      'Note : Alamat domain sisumaker anda. \n Ex : sisumaker.tangerangselatankota.go.id',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.0, fontFamily: 'Ubuntu'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
