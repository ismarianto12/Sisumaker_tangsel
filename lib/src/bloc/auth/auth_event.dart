part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class Login extends AuthEvent {
  final Map data;
  final String year;

  Login({@required this.data, this.year});
}
