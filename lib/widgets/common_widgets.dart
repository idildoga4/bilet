import 'package:bilet/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(String type){
  return AppBar(

            bottom: PreferredSize(preferredSize: const Size.fromHeight(1.0),
            child:Center(
              child: Container(
                color: AppColors.primaryBackground,
                height: 1.0,
              ),
            )),
            title: Center(
              child: Center(
                child: Text(type,
                style: TextStyle(
                    
                  color:AppColors.primaryText,
                  fontSize:16.sp,
                  fontWeight: FontWeight.normal,
                )),
              ),
            )
          );
}