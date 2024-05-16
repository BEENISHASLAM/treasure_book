import 'dart:async';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../views/welcome_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 3), () {
     Get.off(() =>WelcomeView ());
    });
  }
}