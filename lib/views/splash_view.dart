import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:treasure_book/const/app_colors.dart';
import '../controllers/splash_controller.dart';
class SplashView extends StatelessWidget {
   SplashView({Key? key}) : super(key: key);
  final SplashController _controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Appcolor.black,
      body: Center(
        child:Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
