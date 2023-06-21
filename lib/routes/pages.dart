// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:isso_hr_information_system/functions/auth/views/pages/auth_screen.dart';
import 'package:isso_hr_information_system/functions/home_page/views/bloc/home_page_bloc.dart';
import 'package:isso_hr_information_system/functions/home_page/views/pages/home_page.dart';
import 'package:isso_hr_information_system/functions/onboarding/views/bloc/onboarding_bloc.dart';
import 'package:isso_hr_information_system/functions/onboarding/views/pages/onboarding_screen.dart';
import 'package:isso_hr_information_system/routes/names.dart';

import '../functions/auth/views/bloc/auth_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const OnboardingScreen(),
        bloc: BlocProvider(
          create: (_) => OnboardingBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.AUTHENTICATION,
        page: const AuthScreen(),
        bloc: BlocProvider(
          create: (_) => AuthBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePageScreen(),
        bloc: BlocProvider(
          create: (_) => HomePageBloc(),
        ),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //Just copy code here to generate a route
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        /* bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedin = Global.storageService.getIsLoggedIn();
          print(isLoggedin);
          if (isLoggedin) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          print(result);
          return MaterialPageRoute(
              builder: (_) => const Login(), settings: settings);
        }*/
        print(result.first.page);
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("invalid route ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const AuthScreen(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({
    required this.route,
    required this.page,
    required this.bloc,
  });
}
