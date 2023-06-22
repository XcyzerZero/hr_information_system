import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isso_hr_information_system/functions/home_page/views/widgets/home_page_widgets.dart';
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
              //TODO: Add the user information from firebase
              buildSliverAppBar(
                  context: context,
                  employeeName: "Jan Edilbert Namo Solomon",
                  employeePosition: "Mobile App Developer",
                  employeePicture: "assets/images/profile_picture.jpg"),

              //TODO: Add the leave information from firebase
              buildLeaveInformationBox(silNumber: 2, offSetNumber: 5),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 8.h,
                ),
              ),
              buildAttendanceSummaryInformationBox(
                summaryDate: "February 2023",
                summaryPresent: 3,
                summaryAbsent: 2,
                summaryLeave: 4,
              ),
              buildDateTodayBoxAdapter(context),
            ],
          ),
        ),
      ),
    );
  }
}
