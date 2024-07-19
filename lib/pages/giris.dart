import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bilet/bloc/signin_bloc.dart';
import 'package:bilet/bloc/signin_event.dart';
import 'package:bilet/bloc/signin_state.dart';
import 'package:bilet/colors.dart';
import 'package:bilet/controller/signin_controller.dart';
import 'package:bilet/widgets/common_widgets.dart';
import 'package:bilet/widgets/signin_widget.dart';

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
          color: Color.fromARGB(255, 240, 247, 249),
          child: Scaffold(
            backgroundColor: Color.fromARGB(255, 135, 204, 220),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/images/ucak2.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h, bottom: 20.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow:const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Giriş Yap',
                            style: GoogleFonts.alegreya(
                              textStyle: const TextStyle(
                                fontSize: 24,
                                color: Color(0xFF003366),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 20.h),
                          reusableText("Email"),
                          SizedBox(height: 5.h),
                          buildTextField("Mailinizi girin", "email", "user", (value) {
                            context.read<SignInBloc>().add(EmailChanged(value));
                          }),
                          SizedBox(height: 20.h),
                          reusableText("Şifre"),
                          SizedBox(height: 5.h),
                          buildTextField("Şifrenizi girin", "password", "lock", (value) {
                            context.read<SignInBloc>().add(PasswordChanged(value));
                          }),
                          SizedBox(height: 20.h),
                          forgotPassword(),
                          SizedBox(height: 5.h),
                          buildLogInAndRegButton("Giriş Yap", "login", () {
                            SignInController(context: context).handleSignIn("email");
                            Navigator.of(context).pushNamed("flight");
                          }),
                          SizedBox(height: 10.h),
                          buildLogInAndRegButton("Kayıt ol", "register", () {
                            Navigator.of(context).pushNamed("register");
                          }),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DownwardSlantClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height); // Start at bottom left
    path.lineTo(size.width, size.height); // Go to bottom right
    path.lineTo(size.width, size.height - 80); // Go to slightly above bottom right
    path.lineTo(0, size.height - 30); // Go to slightly above bottom left
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
