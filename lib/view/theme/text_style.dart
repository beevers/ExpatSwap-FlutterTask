import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeText {
  static small({color = const Color(0xffa0a5c1)}) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static medium({color = const Color(0xffa0a5c1)}) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 17.sp,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static big({color = const Color(0xff2e3d5c)}) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 22.sp,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }
}
