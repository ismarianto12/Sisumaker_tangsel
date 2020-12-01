part of 'cek_domain_bloc.dart';

@immutable
abstract class CekDomainEvent {}

class CekDomain extends CekDomainEvent {
  final String domain;

  CekDomain({this.domain});
}
