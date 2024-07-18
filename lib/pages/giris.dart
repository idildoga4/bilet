import 'package:bilet/bloc/signin_bloc.dart';
import 'package:bilet/bloc/signin_event.dart';
import 'package:bilet/bloc/signin_state.dart';
import 'package:bilet/colors.dart';
import 'package:bilet/controller/signin_controller.dart';
import 'package:bilet/widgets/common_widgets.dart';
import 'package:bilet/widgets/signin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Giris extends StatefulWidget {
  const Giris({super.key});

  @override
  State<Giris> createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: AppColors.primaryBackground,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.primaryBackground,
              appBar: buildAppBar("Giriş Yap"),
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40.h),
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText("Email"),
                            SizedBox(height: 5.h),
                            buildTextField("Mailinizi girin", "email", "user", (value) {
                              context.read<SignInBloc>().add(EmailChanged(value));
                            }),
                            reusableText("Şifre"),
                            SizedBox(height: 5.h),
                            buildTextField("Şifrenizi girin", "password", "lock", (value) {
                              context.read<SignInBloc>().add(PasswordChanged(value));
                            }),
                            SizedBox(height: 20.h),
                            forgotPassword(),
                            buildLogInAndRegButton("Giriş Yap", "login", () {
                              SignInController(context: context).handleSignIn("email");
                              Navigator.of(context).pushNamed("flight");
                            }),
                           buildLogInAndRegButton("Kayıt ol", "register", () {
                              Navigator.of(context).pushNamed("register");}
                           )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
