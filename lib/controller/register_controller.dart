import 'package:bilet/bloc/register_bloc.dart';
import 'package:bilet/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController{
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state=context.read<RegisterBloc>().state;
    String username=state.username;
    String email=state.email;
    String password=state.password;
    String rePassword=state.rePassword;

    if(username.isEmpty){
      toastInfo(msg: "Kullanıcı adı boş bırakılamaz");
      return;
    }

    if(email.isEmpty)
    {
      toastInfo(msg: "Mail boş bırakılamaz");
      return;
    }

    if(password.isEmpty)
    {
      toastInfo(msg: "Şifre oluşturun");
      return;
  }
    if(rePassword.isEmpty)
    {
      toastInfo(msg: "Şifrenizi tekrar girin");
      return;
  }
  try{
    final credential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    if(credential.user!=null)
    {
    await credential.user?.sendEmailVerification();
    await credential.user?.updateDisplayName(username);
    toastInfo(msg: "Aktive etme maili gönderildi");
    Navigator.of(context).pop();
    }
  }on FirebaseAuthException catch(e){
    if(e.code=='weak-password')
    {
      toastInfo(msg: "Şifre güçsüz");
    }
  else if(e.code=='email-already-in-use'){
    toastInfo(msg: "Mail zaten kullanımda");
  }else if(e.code=='invalid-email')
  {
    toastInfo(msg: "Geçersiz mail");
  }
  }
  }
}