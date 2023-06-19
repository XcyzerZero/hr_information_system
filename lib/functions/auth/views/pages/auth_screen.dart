import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/theme/app_colors.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = "/authScreen";
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/background_image.png",
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          top: 174,
          child: Column(
            children: [
              Container(
                height: 176.h,
                width: 171,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/isso_logo.png"))),
              ),
              Container(
                height: 260.h,
                width: 340.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.neutral30.withOpacity(.3),
                  border: Border.all(color: AppColors.neutral900, width: 2.5),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
