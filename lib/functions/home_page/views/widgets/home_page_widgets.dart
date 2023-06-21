import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/theme/app_colors.dart';

Widget buildSliverAppBar(BuildContext context) {
  return SliverAppBar(
      centerTitle: false,
      elevation: 0,
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
                    buildTitleText("Jan Edilbert Namo Solomon"),
                    buildSubtitleText("Mobile App Developer")
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
                "assets/images/profile_picture.jpg",
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      }));
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
