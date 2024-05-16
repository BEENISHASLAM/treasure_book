import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:treasure_book/views/favourite_view.dart';
import 'package:treasure_book/views/forgot_password_view.dart';
import 'package:treasure_book/views/profile_view.dart';
import 'package:treasure_book/views/welcome_view.dart';

import '../views/about_us_view.dart';
import '../views/book_details_view.dart';

import '../views/change_password_view.dart';
import '../views/home_view.dart';
import '../views/login_view.dart';
import '../views/otp_view.dart';
import '../views/settings_view.dart';
import '../views/signup_view.dart';
import '../views/splash_view.dart';

class AppRouting {
  static List<GetPage<dynamic>> routes  =[
    GetPage(name: "/splashScreen", page:()=>SplashView(),),
    GetPage(name: "/welcomeScreen", page:()=>WelcomeView(),),
    GetPage(name: "/loginScreen", page:()=>LoginView(),),
    GetPage(name: "/signupScreen", page:()=>SignupView()),
    GetPage(name: "/homeScreen", page:()=>HomeView()),
    GetPage(name: "/profileScreen", page:()=>MyProfileView()),
    GetPage(name: "/favoritesScreen", page:()=>FavoritesView()),
    GetPage(name: "/forgotPasswordScreen", page:()=>ForgotPasswordView()),
    GetPage(name: "/settingScreen", page:()=>SettingsView()),
    GetPage(name: "/detailsScreen", page:()=>BookDetailView()),
    GetPage(name: "/otpScreen", page:()=>OTPScreen()),
    GetPage(name: "/changePasswordScreen", page:()=>ChangePasswordView()),
    GetPage(name: "/aboutUsScreen", page:()=>AboutUsView()),

  ];
}