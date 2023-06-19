import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/theme/app_colors.dart';

class AuthController {
  Widget buildInvalidInputEmail(String text) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (text.isEmpty) {
      return Container(
        margin: EdgeInsets.only(left: 5.w),
        child: const Text(
          "please enter your email address",
          style: TextStyle(color: AppColors.danger300),
        ),
      );
    } else if (!emailRegex.hasMatch(text)) {
      return Container(
        margin: EdgeInsets.only(left: 5.w),
        child: const Text(
          "please enter a valid email address",
          style: TextStyle(color: AppColors.danger300),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget buildInvalidInputPassword(String text) {
    if (text.isEmpty) {
      return Container(
        margin: EdgeInsets.only(left: 5.w),
        child: const Text(
          "please enter your password",
          style: TextStyle(color: AppColors.danger300),
        ),
      );
    } else if (text.length < 8) {
      return Container(
        margin: EdgeInsets.only(left: 5.w),
        child: const Text(
          "your password is too short",
          style: TextStyle(color: AppColors.danger300),
        ),
      );
    } else {
      return Container();
    }
  }
}
