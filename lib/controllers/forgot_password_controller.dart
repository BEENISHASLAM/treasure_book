import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:treasure_book/const/app_colors.dart';

class ForgotPasswordController extends GetxController{
  final TextEditingController  emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> globalKeyForm = GlobalKey();
  RxBool isLoading = false.obs;

  Future<void> resetPassword() async {
    try {
      if (globalKeyForm.currentState!.validate()) {

        Get.dialog(
          Center(
            child: CircularProgressIndicator(),
          ),
          barrierDismissible: false,
        );
      await _auth.sendPasswordResetEmail(email: emailController.text);
      isLoading.value = false;
      print("Done");
      Get.snackbar(
        'Password Reset',
        'Password reset email sent. Please check your inbox.',
        backgroundColor:Appcolor.green,
        snackPosition: SnackPosition.TOP,
        colorText: Appcolor.white,
      );

    }} catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Password Reset Failed',
        e.toString(),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}


