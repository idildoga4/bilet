import 'package:bilet/bloc/login_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SignController {
  final BuildContext context;
  SignController({required this.context});

  Future<void> handledSignedIn(String type) async {
    String emailAddress = '';
    String password = '';

    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        emailAddress = state.email;
        password = state.password;

        if (emailAddress.isEmpty) {
          // Handle empty email address
          throw Exception("Email address is empty");
        }
        if (password.isEmpty) {
          // Handle empty password
          throw Exception("Password is empty");
        }
      }
    } catch (e) {
      // Handle the error, e.g., by logging or showing a message to the user
    }

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if(credential.user==null){

      }
      if(credential.user!.emailVerified){

      }
      var user=credential.user;
      if(user!=null)
      {

      }else{
        
      }
      // Handle successful sign-in
    } catch (e) {
      // Handle sign-in error, e.g., invalid email or password
    }
  }
}
