import 'package:bilet/colors.dart';
import 'package:bilet/widgets/common_widgets.dart';
import 'package:bilet/widgets/signin_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
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
                        buildTextField("Mailinizi girin", "email","user"),
                        reusableText("Şifre"),
                        SizedBox(height: 5.h),
                        buildTextField("Şifrenizi girin", "password","lock"),
                        SizedBox(height: 20.h),
                        forgotPassword(),
                        buildLogInAndRegButton("Giriş Yap", "login", (){}),
                        buildLogInAndRegButton("Kayıt ol", "register", (){
                          Navigator.of(context).pushNamed("register");
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
