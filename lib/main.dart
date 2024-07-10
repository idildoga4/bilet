import 'package:bilet/bloc/welcome_bloc.dart';
import 'package:bilet/colors.dart';
import 'package:bilet/pages/loginpage.dart';
import 'package:bilet/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
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
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.primaryBackground,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const Welcome(),
        routes: {
          'login': (context) => const SignIn(),
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
