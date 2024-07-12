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
          toastInfo(msg: "You have no email address");
        }
        if(password.isEmpty){
          toastInfo(msg: "You need to password");
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
            print('No user found for that email.');
            toastInfo(msg: "No user found for that email.");
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
            toastInfo(msg: "Wrong password provided for that user.");
          }else if(e.code=='invalid-email'){
            print('Your email format is wrong');
            toastInfo(msg: "Your email format is wrong");
          }
        }



      }
    }catch(e){
      print(e);
    }
  }

}
