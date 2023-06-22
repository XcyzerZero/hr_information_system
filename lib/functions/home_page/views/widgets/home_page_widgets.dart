import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/theme/app_colors.dart';

Widget buildSliverAppBar({
  required BuildContext context,
  required String employeeName,
  required String employeePosition,
  required String employeePicture,
}) {
  return SliverAppBar(
      centerTitle: false,
      elevation: 10,
      backgroundColor: Colors.transparent,
      expandedHeight: MediaQuery.of(context).size.height * 0.350,
      pinned: true,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final double appBarHeight = constraints.maxHeight;
        final bool isCollapsed = appBarHeight <= kToolbarHeight;
        return Container(
          color: isCollapsed ? AppColors.neutral90 : Colors.transparent,
          child: FlexibleSpaceBar(
            titlePadding:
                EdgeInsets.only(left: 20.w, top: 0, bottom: 0, right: 20.w),
            title: Padding(
              padding: EdgeInsets.only(bottom: 10.h, left: 0.w, right: 0.w),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: isCollapsed
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildTitleText(employeeName),
                    buildSubtitleText(employeePosition)
                  ],
                ),
              ),
            ),
            background: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: AppColors.neutral90,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(.25),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              height: 50,
              width: 50,
              margin:
                  EdgeInsets.only(bottom: 80.h, left: 50, right: 50, top: 50),
              child: Image.asset(
                employeePicture,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      }));
}

Widget buildLeaveInformationBox({
  required int silNumber,
  required int offSetNumber,
}) {
  return SliverToBoxAdapter(
    child: Container(
      margin: EdgeInsets.only(top: 8.h),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "AVAILABLE LEAVE",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.neutral600,
                    ),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SIL",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20.sp),
                          ),
                          Text(
                            silNumber.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 31.sp),
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.neutral600,
                    ),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "OFFSET",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20.sp),
                          ),
                          Text(
                            offSetNumber.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 31.sp),
                          ),
                        ]),
                  ),
                ),
              ],
            )
          ]),
    ),
  );
}

Widget buildAttendanceSummaryInformationBox({
  required String summaryDate,
  required int summaryPresent,
  required int summaryAbsent,
  required int summaryLeave,
}) {
  return SliverToBoxAdapter(
    child: Container(
        margin: EdgeInsets.only(
          top: 12.h,
        ),
        child: Column(
          children: [
            Text(
              "ATTENDANCE SUMMARY",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.neutral600,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
              margin: EdgeInsets.only(
                  top: 8.h, right: 12.w, left: 12.w, bottom: 8.h),
              child: Column(children: [
                Text(
                  summaryDate.toString(),
                  style: const TextStyle(
                      fontFamily: "Inter", fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    buildExpandedAttendanceSummaryBoxes(
                      summaryName: "Present",
                      summaryNumber: summaryPresent,
                      boxColor: AppColors.success100,
                    ),
                    buildExpandedAttendanceSummaryBoxes(
                      summaryName: "Absent",
                      summaryNumber: summaryAbsent,
                      boxColor: AppColors.danger100,
                    ),
                    buildExpandedAttendanceSummaryBoxes(
                      summaryName: "Leave",
                      summaryNumber: summaryLeave,
                      boxColor: AppColors.primary100,
                    ),
                  ],
                )
              ]),
            )
          ],
        )),
  );
}

Widget buildExpandedAttendanceSummaryBoxes({
  required String summaryName,
  required int summaryNumber,
  required Color boxColor,
}) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(.25),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
        gradient: LinearGradient(
          colors: [boxColor, AppColors.neutral10],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Text(
            summaryName,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            summaryNumber.toString(),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24.sp),
          ),
        ],
      ),
    ),
  );
}

Widget buildDateTodayBoxAdapter(BuildContext context) {
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(.25),
              blurRadius: 10,
              spreadRadius: 3,
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      width: MediaQuery.of(context).size.width,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          height: 7.h,
          width: 103.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xFFd9d9d9),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        Text(
          "Date Today",
          style: TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
              fontSize: 24.sp),
        ),
        SizedBox(
          height: 4.h,
        ),
        buildTimeInTimeOutContainer(
          context,
          "Time-In",
          "09:00 AM",
        ),
        buildTimeInTimeOutContainer(
          context,
          "Time-Out",
          "06:00 PM",
        ),
        SizedBox(
          height: 12.h,
        )
      ]),
    ),
  );
}

Widget buildTimeInTimeOutContainer(
    BuildContext context, String text, String timeDate) {
  return Container(
    margin: EdgeInsets.only(top: 16.h),
    height: 155.h,
    padding: EdgeInsets.symmetric(
      vertical: 8.h,
      horizontal: 16.w,
    ),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(.25),
          blurRadius: 5,
          spreadRadius: 3,
        ),
      ],
      borderRadius: BorderRadius.circular(5),
      gradient: const LinearGradient(
        colors: [AppColors.neutral100, AppColors.neutral10],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.red),
          height: MediaQuery.of(context).size.height,
          width: 144.w,
          child: Image.asset(
            "assets/images/profile_picture.jpg",
            fit: BoxFit.fill,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              timeDate,
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    ),
  );
}

Widget buildTitleText(String text) {
  return Text(
    text,
    style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 14.sp,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.bold),
  );
}

Widget buildSubtitleText(String text) {
  return Text(
    text,
    style: TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: 12.sp,
      color: Colors.black,
      fontFamily: "Inter",
    ),
  );
}
