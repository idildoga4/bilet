import 'package:bilet/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(){
  return AppBar(

            bottom: PreferredSize(preferredSize: const Size.fromHeight(1.0),
            child:Center(
              child: Container(
                color: AppColors.primaryBackground,
                height: 1.0,
              ),
            )),
            title: Center(
              child: Text("Giriş",
              style: TextStyle(
                  
                color:AppColors.primaryText,
                fontSize:16.sp,
                fontWeight: FontWeight.normal,
              )),
            )
          );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.5),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget buildTextField(String hintText, String textType) {
  return Container(
    width: 325.w,
    height: 50.w,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: AppColors.primaryFourElementText),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: TextField(
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintStyle: const TextStyle(
            color: AppColors.primarySecondaryElementText,
          ),
        ),
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.normal,
          fontSize: 14.sp,
        ),
        autocorrect: false,
        obscureText: textType == "password" ? true : false,
      ),
    ),
  );
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(left: 7.w),
    width: 240.w,
    height: 15.h,
    alignment: Alignment.centerLeft,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Şifremi unuttum",
        style: TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontSize: 12.sp,
        ),
      ),
    ),
  );
}

Widget buildLogInAndRegButton(String buttonName, String buttonType) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(left: 20.w, right: 25.w, top: buttonType == "login" ? 40.h : 20.h),
      decoration: BoxDecoration(
        color: buttonType == "login" ? AppColors.primaryElement : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
          color: buttonType == "login" ? Colors.transparent : AppColors.primaryFourElementText,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
            color: Colors.grey.withOpacity(0.1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: buttonType == "login" ? AppColors.primaryBackground : AppColors.primaryText,
          ),
        ),
      ),
    ),
  );
}
