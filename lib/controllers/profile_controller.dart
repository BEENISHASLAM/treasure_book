import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController{
  RxString name = ''.obs;
  RxString email = ''.obs;



  @override
  Future<void> onInit() async  {
    super.onInit();
    loadUserDataFromPreferences();
  }


  Future<void> loadUserDataFromPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      name.value = prefs.getString('name') ?? '';
      email.value = prefs.getString('email') ?? '';
    } catch (e) {
      print('Error loading user data: $e');
    }
    print(name.value);
  }


  // logout

  Future<void> logout() async {
    try {

      await FirebaseAuth.instance.signOut();
      Get.dialog(
        Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );
      Get.offAllNamed('/loginScreen',)?.then((value){
        // emailController.clear();
        // passwordController.clear();
      }
      );
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}


