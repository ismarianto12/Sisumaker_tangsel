import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sisumakerv2/src/model/common_model.dart';
import 'package:sisumakerv2/src/provider/common_provider.dart';

part 'cek_domain_event.dart';
part 'cek_domain_state.dart';
part 'cek_domain_validate.dart';

CommonProvider _commonProvider = CommonProvider();

class CekDomainBloc extends Bloc<CekDomainEvent, CekDomainState> {
  CekDomainBloc() : super(CekDomainInitial());

  Stream<CekDomainState> mapEventToState(CekDomainEvent event) async* {
    if (event is CekDomain) {
      yield CekDomainLoading();
      try {
        await _commonProvider.cekApi(event.domain);
        yield CekDomainSucces();
      } catch (e) {
        // Maping ressponse error to model
        final error = ResponseModel.fromJson(e);
        yield CekDomainError(responseModel: error);
      }
    }
  }
}
