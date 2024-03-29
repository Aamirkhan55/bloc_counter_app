import 'package:bloc/bloc.dart';
import 'package:bloc_counter_app/services/auth/bloc/auth_events.dart';
import 'package:bloc_counter_app/services/auth/bloc/auth_state.dart';

import 'auth_provider.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  const AuthBloc(AuthProvider provider) : super( AuthStateLoading()) {
    on<AuthEventInitialize>((event, emit) async{
      await provider.initialize();
      final user = provider.currentUser;
      if (user == null) {
        emit (const AuthStateLoggedOut());
      } else if(!user.isEmailVarified) {
        emit(const AuthStateNeedVarification());
      } else {
        emit (AuthStateLoggedIn(user));
      }
    },);

    on<AuthEventLogIn>((event, emit) async{
      emit(const AuthStateLoading());
      final email = event.email;
      final password = event.password;
      try {
        final user = await provider.logIn(email: email, password: password);
        emit(AuthStateLoggedIn(user));
      } on Exception catch (e) {
        emit( AuthStateLogInFailure(e));
      }
    },);

    on<AuthEventLogOut>((event, emit) async{
      try {
        emit(const AuthStateLoading());
        await provider.logOut();
        emit(const AuthStateLoggedOut());
      }on Exception catch (e) {
         emit (AuthStateLoggedOutFailure(e));
      }
    },);
  }
}