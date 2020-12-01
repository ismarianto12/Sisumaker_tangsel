// import 'package:sisumakerv2/modul/surat_masuk/model/surat_masuk_model.dart';
part of 'package:sisumakerv2/modul/surat_masuk/bloc/surat_masuk_bloc.dart';

@immutable
abstract class SuratMasukEvent {}

class Suratmasuk extends SuratMasukEvent {
  final String page;
  final String search;

  Suratmasuk({this.page, this.search});
}
