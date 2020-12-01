part of 'cek_domain_bloc.dart';

@immutable
abstract class CekDomainState {}

class CekDomainInitial extends CekDomainState {}

class CekDomainLoading extends CekDomainState {}

class CekDomainSucces extends CekDomainState {
  final ResponseModel responseModel;

  CekDomainSucces({this.responseModel});
}

class CekDomainError extends CekDomainState {
  final ResponseModel responseModel;

  CekDomainError({this.responseModel});
}
