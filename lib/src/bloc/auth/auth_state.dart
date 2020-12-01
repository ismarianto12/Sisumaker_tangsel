part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSucces extends AuthState {}

class AuthError extends AuthState {
  final ResponseModel responseModel;

  AuthError({this.responseModel});
}
