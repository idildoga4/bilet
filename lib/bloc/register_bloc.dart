import 'package:bilet/bloc/register_event.dart';
import 'package:bilet/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{ //RegisterBloc sınıfı state ve event sınıfşarından türetilir
 RegisterBloc():super(const RegisterState()){  
  on<UserNameEvent>(_userNameEvent);
  on<EmailEvent>(_EmailEvent);
  on<PasswordEvent>(_PasswordEvent);
  on<rePasswordEvent>(_rePasswordEvent); //on, fonksiyonları kaydeder
 }

 void _userNameEvent(UserNameEvent event, Emitter<RegisterState> emit ) //emit metodu mevcut durumu kopyalar ve mail alanını günceller
 {
  emit(state.copyWith(username:event.username));
 }

 void _EmailEvent(EmailEvent event, Emitter<RegisterState> emit )
 {
  emit(state.copyWith(email:event.email));
 }

 void _PasswordEvent(PasswordEvent event, Emitter<RegisterState> emit )
 {
  emit(state.copyWith(password:event.password));
 }

 void _rePasswordEvent(rePasswordEvent event, Emitter<RegisterState> emit )
 {
  emit(state.copyWith(rePassword:event.rePassword));
 }
}