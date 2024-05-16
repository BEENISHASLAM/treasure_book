
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treasure_book/const/app_colors.dart';
class SignupController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode conPasswordFocus = FocusNode();
  final FocusNode nameFocus = FocusNode();

  RxBool obscureText = true.obs;
  Rx<IconData> suffixIcon = Icons.remove_red_eye_rounded.obs;

  final GlobalKey<FormState> globalKeyForm = GlobalKey();
  RxBool loading = true.obs;

  void showPassword() {
    obscureText.value = !obscureText.value;
    suffixIcon.value = obscureText.value ? Icons.remove_red_eye_rounded : Icons.remove_red_eye_outlined;
  }
  Future<void> signup() async {
    if (globalKeyForm.currentState!.validate()) {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        print('Email or password is empty');
        return;
      }
      try {
        Get.dialog(
          Center(
            child: CircularProgressIndicator(),
          ),
          barrierDismissible: false,
        );

        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        if (credential != null) {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('name', nameController.text);
          prefs.setString('email', emailController.text);
          Get.back(); // Dismiss the loader
          Get.snackbar(
              'Account Created Successfully!',
              '',
              backgroundColor: Appcolor.green,
              snackPosition: SnackPosition.TOP,
              colorText: Appcolor.white);

          Get.offAndToNamed('/loginScreen')?.then((value) {
            // This code will run when you navigate back from the dashboard
            emailController.clear();
            passwordController.clear();
            confPasswordController.clear();
            nameController.clear();
          });
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          Get.snackbar(
              'The account already exists for that email',
              '',
              backgroundColor: CupertinoColors.destructiveRed,
              snackPosition: SnackPosition.TOP,
              colorText: Appcolor.white);
        }
      } catch (e) {
        print(e);
      } finally {
        loading.value = false; // Set loading to false after all operations
      }
    }
  }





}
