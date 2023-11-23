import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpaceUtil {
  static w(double width) {
    return SizedBox(width: width.w);
  }

  static h(double height) {
    return SizedBox(height: height.h);
  }

  static b(double width, double height) {
    return SizedBox(width: width.w, height: height.h);
  }
}
