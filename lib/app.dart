import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isso_hr_information_system/routes/pages.dart';

import 'functions/auth/views/pages/auth_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.allBlocProviders(context)],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AuthScreen(),
            onGenerateRoute: AppPages.GenerateRouteSettings,
          ),
        ));
  }
}
