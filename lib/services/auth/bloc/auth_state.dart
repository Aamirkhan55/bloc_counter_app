import 'package:flutter/material.dart';

import 'auth_user.dart';

@immutable
abstract class AuthState {
  const AuthState() ;
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;
  const AuthStateLoggedIn(this.user);
}

class AuthStateLogInFailure extends AuthState {
  final Exception exception;
  const AuthStateLogInFailure(this.exception);
}

class AuthStateNeedVarification extends AuthState {
  const AuthStateNeedVarification();
}

class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut();
}

class AuthStateLoggedOutFailure extends AuthState {
  const AuthStateLoggedOutFailure();
}