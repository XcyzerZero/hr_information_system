import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isso_hr_information_system/functions/auth/views/pages/auth_screen.dart';
import 'package:isso_hr_information_system/functions/onboarding/views/bloc/onboarding_bloc.dart';

import '../../../../constant/theme/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = "/onboardingScreen";
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.neutral200,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 130.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<OnboardingBloc>(context)
                          .add(OnboardingEvent());
                    },
                    children: [
                      _page(
                        index: 1,
                        context: context,
                        buttonName: "Next",
                        title: "Quick Clock In",
                        subTitle:
                            "easy time-in time-out using automated functions",
                        imagePath: "assets/images/onboarding1.svg",
                      ),
                      _page(
                        index: 2,
                        context: context,
                        buttonName: "Next",
                        title: "Efficient",
                        subTitle:
                            "for maximum productivity with minimum wasted effort and expenses",
                        imagePath: "assets/images/onboarding2.svg",
                      ),
                      _page(
                        index: 3,
                        context: context,
                        buttonName: "Get Started",
                        title: "Secure",
                        subTitle:
                            "accessible only for Innovative Solutions For Strategic Organization Inc.",
                        imagePath: "assets/images/onboarding3.svg",
                      )
                    ],
                  ),
                  Positioned(
                      bottom: 92.h,
                      child: DotsIndicator(
                        position: state.page,
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                            color: AppColors.primary100,
                            activeColor: AppColors.primary300,
                            size: const Size.square(8.0),
                            activeSize: const Size(18.0, 8.0),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page({
    required int index,
    required BuildContext context,
    required String buttonName,
    required String title,
    required String subTitle,
    required String imagePath,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 250.w,
          height: 250.h,
          child: SvgPicture.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 32.h,
        ),
        Text(
          title,
          style: TextStyle(
              fontFamily: "Anton",
              color: AppColors.primary500,
              fontSize: 32.sp,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16.h,
        ),
        Container(
          width: 376.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.primary200,
                fontSize: 16.sp,
                fontFamily: "Inter",
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              //animation
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            } else {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AuthScreen.routeName, (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 64.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.neutral50,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: AppColors.primary100,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
