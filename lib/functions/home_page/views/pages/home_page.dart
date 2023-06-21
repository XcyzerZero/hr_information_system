import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isso_hr_information_system/functions/home_page/views/widgets/home_page_widgets.dart';
import '';
import '../../../../constant/theme/app_colors.dart';

class HomePageScreen extends StatelessWidget {
  static const routeName = "/homePageScreen";
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.neutral100, AppColors.neutral10],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              buildSliverAppBar(context),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 8.h),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "AVAILABLE LEAVE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.sp),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.neutral300,
                                ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 12.h),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "SIL",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.sp),
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 31.sp),
                                      ),
                                    ]),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.neutral300,
                                ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 12.h),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "OFFSET",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.sp),
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 31.sp),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 400,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 400,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
