import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:sisumakerv2/modul/surat_masuk/model/surat_masuk_model.dart';
import 'package:sisumakerv2/modul/surat_masuk/provider/surat_masuk_provider.dart';
// import 'package:sisumakerv2/src/provider/common_provider.dart';
import 'package:equatable/equatable.dart';

part 'surat_masuk_state.dart';
part 'surat_masuk_event.dart';

class SuratMasukBloc extends Bloc<SuratMasukEvent, SuratMasukState> {
  SuratMasukBloc() : super(SuratmasukinInitial());

  @override
  Stream<SuratMasukState> mapEventToState(SuratMasukEvent event) async* {
    if (event is Suratmasuk) {
      // if loading data
      // print('kampret');
      yield SuratmasukinLoading();
      try {
        final suratMasukModel = await SuratmasukProv.fetchSuratMasuk();
        yield SuratmasukSucces(suratMasukModel: suratMasukModel);
      } catch (e) {
        final error = SuratMasukModel.fromJson(e);
        yield SuratmasukError(suratMasukModel: error);
      }
    }
  }
}
