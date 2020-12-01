part of 'cek_domain_bloc.dart';

class CekDomainValidate {
  final _domain = BehaviorSubject<String>();
  Function(String) get onchangeDomain => _domain.sink.add;
  Stream<String> get streamDomain => _domain.stream.transform(
        StreamTransformer<String, String>.fromHandlers(
          handleData: (value, sink) {
            if (value.isNotEmpty) {
              sink.add(value);
            } else {
              sink.addError("Domain Tidak boleh kosong");
            }
          },
        ),
      );

  Stream<bool> get cekDomain => Rx.combineLatest(
        [streamDomain],
        (a) => true,
      );

  dispose() {
    _domain.close();
  }
}
