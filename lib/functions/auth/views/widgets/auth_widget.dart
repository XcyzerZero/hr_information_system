import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/theme/app_colors.dart';

Widget buildTextField(
  String stateBloc,
  BuildContext context,
  String hintText,
  String textType,
  IconData iconName,
  void Function(String value)? func,
) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(.25),
          blurRadius: 5,
          spreadRadius: 2,
        ),
      ],
      color: AppColors.neutral30,
      border: Border.all(color: AppColors.neutral900, width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(5.w),
      ),
    ),
    child: Row(children: [
      Expanded(
        flex: 1,
        child: Container(
          margin: EdgeInsets.only(left: 17.w),
          child: Icon(
            iconName,
            color: AppColors.neutral900,
          ),
        ),
      ),
      Expanded(
        flex: 6,
        child: SizedBox(
          child: TextFormField(
            validator: (value) => errorText(value!, textType),
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 1, horizontal: 12),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: AppColors.neutral900,
                fontFamily: "Inter",
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            style: TextStyle(
              color: AppColors.primary500,
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        ),
      )
    ]),
  );
}

Widget buildLoginButton(String buttonName, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: AppColors.primary300,
          borderRadius: BorderRadius.circular(5.w),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
              color: Colors.grey.withOpacity(0.1),
            )
          ]),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
      ),
    ),
  );
}

String? errorText(String value, String textType) {
  print(value);
  if (value.isEmpty) {
    return "Please enter an $textType";
  }
  return "It is okay";
}
