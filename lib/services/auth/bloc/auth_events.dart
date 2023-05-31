import 'package:flutter/material.dart';

@immutable
abstract class AuthEvents {
  const AuthEvents();
}

class AuthEventInitialize extends AuthEvents {
  const AuthEventInitialize();
}

class AuthEventLogIn extends AuthEvents {
  final String email;
  final String password;
  const AuthEventLogIn(
    this.email,
    this.password,
  );
}
