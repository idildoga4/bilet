import 'package:bilet/bloc/register_bloc.dart';
import 'package:bilet/bloc/register_event.dart';
import 'package:bilet/bloc/register_state.dart';
import 'package:bilet/colors.dart';
import 'package:bilet/controller/register_controller.dart';
import 'package:bilet/widgets/common_widgets.dart';
import 'package:bilet/widgets/signin_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Kayit extends StatefulWidget{
  const Kayit({Key? key}) : super(key:key);
  @override   
  State<Kayit> createState()=> _KayitState();
}

class _KayitState extends State<Kayit>
{
  @override  
  Widget build(BuildContext context){
    return BlocBuilder<RegisterBloc,RegisterState>(builder:(context,state){

      return Container(
        color:AppColors.primaryBackground,
        child:SafeArea(
          child:Scaffold(
            backgroundColor: AppColors.primaryBackground,
            appBar: buildAppBar(""),
            body: SingleChildScrollView(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
              
                  Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 36.h),
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText("Kullanıcı adı"),
                            buildTextField("Kullanıcı adınızı girin", "name","user" ,(value) {
                              context.read<RegisterBloc>().add(UserNameChanged(value));
                            },),
                            SizedBox(height: 5.h),
                            reusableText("Email"),
                            buildTextField("Mailinizi girin", "email","user", (value) {
                              context.read<RegisterBloc>().add(EmailChanged(value));
                            },),
                            SizedBox(height: 5.h),
                            reusableText("Parola"),
                            buildTextField("Parola Oluşturun", "password","lock", (value) {
                              context.read<RegisterBloc>().add(PasswordChanged(value));
                            },),
                            SizedBox(height: 5.h),
                            reusableText("Parolanızı doğrulayın"),
                            buildTextField("Parolanızı tekrar girin", "password","lock", (value) {
                              context.read<RegisterBloc>().add(rePasswordChanged(value));
                            },),
                            
                        
                            Container(
                              margin:EdgeInsets.only(left:25.w),
                              child:reusableText("Kayıt olmak için bilgilerinizi giriniz"),
                            ),
                            buildLogInAndRegButton("Kayıt ol", "kayit", (){
                              RegisterController(context: context).handleEmailRegister();
                            }),
                          ],
                        ),
                      ),
                      
                  )
                ]
              )
            )
      
          )
        )
      );
    }
    );
  }
}