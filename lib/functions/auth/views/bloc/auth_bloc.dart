import 'dart:async';

import 'package:bloc/bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super((const AuthState())) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  FutureOr<void> _emailEvent(EmailEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _passwordEvent(PasswordEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
