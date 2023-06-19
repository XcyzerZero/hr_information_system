import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isso_hr_information_system/functions/auth/repositories/auth_controller.dart';
import 'package:isso_hr_information_system/functions/auth/views/bloc/auth_bloc.dart';
import 'package:isso_hr_information_system/functions/auth/views/widgets/auth_widget.dart';

import '../../../../constant/theme/app_colors.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = "/authScreen";
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Container(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      top: 20.h,
                    ),
                    height: 260.h,
                    width: 340.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.neutral30.withOpacity(.3),
                      border:
                          Border.all(color: AppColors.neutral900, width: 2.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTextField(state.email, context, "Email Address",
                            "email", Icons.email_outlined, (value) {
                          context.read<AuthBloc>().add(EmailEvent(value));
                        }),
                        AuthController().buildInvalidInputEmail(state.email),
                        SizedBox(
                          height: 20.h,
                        ),
                        buildTextField(state.password, context, "Password",
                            "password", Icons.key_outlined, (value) {
                          context.read<AuthBloc>().add(PasswordEvent(value));
                        }),
                        AuthController()
                            .buildInvalidInputPassword(state.password),
                        SizedBox(
                          height: 28.h,
                        ),
                        buildLoginButton("Login", () {})
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        )
      ]),
    );
  }
}
