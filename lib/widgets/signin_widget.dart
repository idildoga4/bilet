import 'package:bilet/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

Widget buildTextField(String hintText, String textType, String s,
void Function(String value)? func) {
  return Container(
    width: 325.w,
    height: 50.w,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Color.fromARGB(49, 158, 158, 158),
      borderRadius: BorderRadius.all(Radius.circular(30)),
      border: Border.all(color: Colors.grey),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: TextField(
        onChanged:(value)=>func!(value),
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
Widget _reusableIcons(String iconName){
  return GestureDetector(
          onTap:(){

          },
          child: SizedBox(
            width: 40.w,
            height: 40.w,
            child: Image.asset("assets/icons/$iconName.png"),
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

Widget buildLogInAndRegButton(String buttonName, String buttonType, void Function()? func) {
  return GestureDetector(
    onTap:func,
    child: Container(
      width: 356.w,
      height: 58.h,
      margin: EdgeInsets.only(left: 20.w, right: 25.w, top: buttonType == "login" ? 40.h : 20.h),
      decoration: BoxDecoration(
        color: buttonType == "login" ? Color(0xFF003366) : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
          color: buttonType == "login" ? Colors.transparent : AppColors.primaryFourElementText,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
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
