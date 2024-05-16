import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:treasure_book/const/app_colors.dart';
class LoginController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  RxBool obscureText = true.obs;
  Rx<IconData> suffixIcon = Icons.remove_red_eye_rounded.obs;
  RxString userEmail = ''.obs;
  RxString name = ''.obs;
  var isLoading = true.obs;
  final GlobalKey<FormState> globalKey = GlobalKey();
  void showPassword() {
    obscureText.value = !obscureText.value;
    suffixIcon.value = obscureText.value ? Icons.remove_red_eye_rounded : Icons.remove_red_eye_outlined;
  }

  Future<void> login() async {
    if (globalKey.currentState!.validate()) {
      try {
        Get.dialog(
          Center(
            child: CircularProgressIndicator(),
          ),
          barrierDismissible: false,
        );
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        if (credential != null) {
          print("user login Successfully!!!");
          Get.snackbar(
            'Welcome',
            'You are logged in Successfully',
            backgroundColor: Appcolor.green,
            snackPosition: SnackPosition.TOP,
            colorText: Appcolor.white,
          );

          Get.offAllNamed('/homeScreen')?.then((value) {
            // This code will run when you navigate back from the dashboard
            emailController.clear();
            passwordController.clear();
          });
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
            'User',
            'Wrong password ',
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.TOP,
            colorText: Appcolor.white,
          );
          print('Wrong password provided for that user.');
        }
      } finally {
        Get.back(); // Dismiss the loader
      }
    }
  }







//  signout




  Future<void> signInWithGoogle() async {
  try {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
  accessToken: googleSignInAuthentication.accessToken,
  idToken: googleSignInAuthentication.idToken,
  );

  UserCredential? userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  if (userCredential != null) {
  // Successfully signed in with Google
  User user = userCredential.user!;
  Get.toNamed('/homeScreen');
  print('Signed in with Google: ${user.displayName}');
  } else {
  // Handle sign-in failure
    print("Sign in failed");
  Get.snackbar(
  'Sign-In Failed',
  'Failed to sign in with Google',
  backgroundColor: Colors.red,
  snackPosition: SnackPosition.TOP,
  colorText: Colors.white,
  );
  }
  }
  } catch (e) {
  print(e.toString());
  }
  }
  }









