import 'package:bilet/bloc/signin_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bilet/bloc/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {

  SignInBloc() : super(const SignInState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
  }

  void _onEmailChanged(
      EmailChanged event,
      Emitter<SignInState> emit,
      ) {
    emit(state.copyWith(email: event.email));
  }


  void _onPasswordChanged(
      PasswordChanged event,
      Emitter<SignInState> emit,
      ) {
    emit(state.copyWith(password: event.password));
  }


}