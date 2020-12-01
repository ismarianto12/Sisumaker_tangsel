part of 'auth_bloc.dart';

class AuthValidate {
  final _username = BehaviorSubject<String>();
  Function(String) get onchangeUsername => _username.sink.add;
  Stream<String> get streamUsername => _username.stream.transform(
        StreamTransformer<String, String>.fromHandlers(
          handleData: (value, sink) {
            if (value.isNotEmpty) {
              sink.add(value);
            } else {
              sink.addError("Username Tidak boleh kosong");
            }
          },
        ),
      );

  final _password = BehaviorSubject<String>();
  Function(String) get onchangePassword => _password.sink.add;
  Stream<String> get streamPassword => _password.stream.transform(
        StreamTransformer<String, String>.fromHandlers(
          handleData: (value, sink) {
            if (value.isNotEmpty) {
              sink.add(value);
            } else {
              sink.addError("Password Tidak boleh kosong");
            }
          },
        ),
      );

  final _year = BehaviorSubject<String>();
  StreamSink<String> get steramSinkYear => _year.sink;
  Stream<String> get streamYear => _year.stream.transform(
        StreamTransformer<String, String>.fromHandlers(
          handleData: (value, sink) {
            if (value.isNotEmpty) {
              sink.add(value);
            } else {
              sink.addError("Tahun Tidak boleh kosong");
            }
          },
        ),
      );

  Stream<bool> get submitLogin => Rx.combineLatest3(
        streamUsername,
        streamPassword,
        streamYear,
        (a, b, c) => true,
      );

  dispose() {
    _username.close();
    _password.close();
    _year.close();
  }
}
