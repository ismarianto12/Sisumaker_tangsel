part of 'surat_masuk_bloc.dart';

@immutable
abstract class SuratMasukState {}

class SuratmasukinInitial extends SuratMasukState {}

class SuratmasukinLoading extends SuratMasukState {}

class SuratmasukSucces extends SuratMasukState {
  final SuratMasukModel suratMasukModel;
  SuratmasukSucces({this.suratMasukModel});
}

class SuratmasukError extends SuratMasukState {
  final SuratMasukModel suratMasukModel;
  SuratmasukError({this.suratMasukModel});
}
