import 'package:bilet/bloc/signin_bloc.dart';
import 'package:bilet/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController{
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try{
      if(type=="email"){
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if(emailAddress.isEmpty){
          toastInfo(msg: "Email adresiniz bulunamadı");
        }
        if(password.isEmpty){
          toastInfo(msg: "Şifreyi giriniz");
        }
        try{
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: password);
          if(credential.user==null){}
          if(!credential.user!.emailVerified){}
          var user = credential.user;
          if(user!=null){

          }else{

          }



        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('Kullanıcı bulunamadı.');
            toastInfo(msg: "Kullanıcı bulunamadı.");
          } else if (e.code == 'wrong-password') {
            print('Yanlış şifre');
            toastInfo(msg: "Yanlış şifre");
          }else if(e.code=='invalid-email'){
            print('Mail formatını gözden geçirin.');
            toastInfo(msg: "Mail formatını gözden geçirin.");
          }
        }



      }
    }catch(e){
      print(e);
    }
  }

}
