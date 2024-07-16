import 'package:bilet/bloc/register_bloc.dart';
import 'package:bilet/bloc/signin_bloc.dart';
import 'package:bilet/bloc/welcome_bloc.dart';
import 'package:bilet/colors.dart';
import 'package:bilet/pages/loginpage.dart';
import 'package:bilet/pages/signinpage.dart';
import 'package:bilet/pages/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  Firebase.initializeApp();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WelcomeBloc>(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider<SignInBloc>(
        create: (context)=> SignInBloc(),
      ),
      BlocProvider(create: (context) => RegisterBloc())
      ],
      
      
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme:IconThemeData(color:AppColors.primaryText) ,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: AppColors.primaryBackground,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const Welcome(),
        routes: {
          'homepage':(context)=> const Welcome(),
          'login': (context) => const SignIn(),
          'register': (context) => const register(),
        },
        builder: (context, widget) {
          ScreenUtil.init(
            context,
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
          );
          return widget!;
        },
      ),
    );
  }
}
