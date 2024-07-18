

import 'package:bilet/bloc/register_event.dart';
import 'package:bilet/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  RegisterBloc() : super(const RegisterState()) {
    on<UserNameChanged>((_onUserNameChanged));
    on<EmailChanged>((_onEmailChanged));
    on<PasswordChanged>((_onPasswordChanged));
    on<rePasswordChanged>((_onRePasswordChanged));
  }

  void _onUserNameChanged(
      UserNameChanged event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(username: event.username));
  }

  void _onEmailChanged(
      EmailChanged event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
      PasswordChanged event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(password: event.password));
  }

  void _onRePasswordChanged(
      rePasswordChanged event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(repassword: event.rePassword));
  }


}