import 'package:bilet/colors.dart';
import 'package:bilet/widgets/common_widgets.dart';
import 'package:bilet/widgets/signin_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class register extends StatefulWidget{
  const register({Key? key}) : super(key:key);
  @override   
  State<register> createState()=> _RegisterState();
}

class _RegisterState extends State<register>
{
  @override  
  Widget build(BuildContext context){
    return Center(
      child: Container(
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
                              
                            },),
                            SizedBox(height: 5.h),
                            reusableText("Email"),
                            buildTextField("Mailinizi girin", "email","user", (value) {
                              
                            },),
                            SizedBox(height: 5.h),
                            reusableText("Parola"),
                            buildTextField("Parola Oluşturun", "password","lock", (value) {
                              
                            },),
                            SizedBox(height: 5.h),
                            reusableText("Parolanızı doğrulayın"),
                            buildTextField("Parolanızı tekrar girin", "password","lock", (value) {
                              
                            },),
                            
                        
                            reusableText("Kayıt olmak için bilgilerinizi giriniz"),
                            buildLogInAndRegButton("Kayıt ol", "register", (){
                              Navigator.of(context).pushNamed("register");
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
      ),
    );
  }
}