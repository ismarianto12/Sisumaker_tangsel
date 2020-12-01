import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sisumakerv2/src/model/common_model.dart';
import 'package:sisumakerv2/src/provider/auth_provoder.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_validate.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is Login) {
      yield AuthLoading();
      try {
        await AuthProvider.login(event.data, event.year);
        yield AuthSucces();
      } catch (e) {
        yield AuthError(responseModel: e);
      }
    }
  }
}
