import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treasure_book/const/app_colors.dart';
import 'package:treasure_book/const/custom_button.dart';
import 'package:treasure_book/const/custome_text.dart';
import 'package:treasure_book/controllers/login_controller.dart';
import '../const/custom_text_field.dart';
import '../const/helper_function.dart';
class LoginView extends StatelessWidget {
  LoginController controller = Get.put(LoginController());
 LoginView({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Appcolor.black,
    appBar: AppBar(
      backgroundColor: Appcolor.black,
      title:heading("Log in"),
      leading: IconButton(
        icon: Image.asset(
          'assets/icons/Icon.png',
          width: 24,
          height: 24,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: controller.globalKey,
                  child: Column(
                   // mainAxisAlignment: MainAxisAlignment.center,
                   // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        width: 100,
                        height:100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/login.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      normalText1("Enter credentials below to login"),
                      SizedBox(height: 20,),
                      Container(
                      child: Column(children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:20.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: normalText1("Email")),
                        ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal:15.0),
                              child: CustomTextField(
                                controller: controller.emailController,
                                focus: controller.emailFocus,
                                hintText: "xyz@gmail.com",
                              onValidate:(str){
                              return HelperFunction.checkEmail(str);
                              },

                                suffixIcon: Image.asset(
                  'assets/icons/email.png',
                  width: 25,
                  height: 25,
                                ),


                              ),
                            ),

                            ],),
                            ),
                      SizedBox(height: 20,),
                      Container(
                        child: Column(children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal:20.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: normalText1("Password")),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal:15.0),
                            child:Obx(() => CustomTextField(
                              obscureText: controller.obscureText.value,
                              controller: controller.passwordController,
                              focus: controller.passwordFocus,
                              hintText: "xyhJk&*er#?12%",
                              onValidate:(str){
                                return HelperFunction.checkPassword(str);
                              },

                                suffixIcon:IconButton(
                                    onPressed:(){controller.showPassword();},
                                    icon:Icon(controller.suffixIcon.value, color: Appcolor.lightGrey,))

                            ),)
                          ),

                        ],),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal:15.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child:InkWell(
                            onTap:(){
                              Get.toNamed('/forgotPasswordScreen');
                            },
                              child: normalText1("Forgot Password?")),
                        ),
                      ),
                     Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:15.0),
                        child: CustomButton(
                            text: "Login", onPressed:(){
                              controller.login();
                        }),
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:15.0),
                        child: CustomOutlinedButton(
                          imagePath: "assets/icons/Google.png",
                          text: "Sign up with Google",
                            onPressed: (){
                              controller.signInWithGoogle();
                            },

                        ),
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:15.0),
                        child: CustomOutlinedButton(
                          imagePath: "assets/icons/facebook.png",
                          text: "Sign up with Facebook",
                          onPressed: () {
                            // Add your onPressed logic here
                          },
                        ),
                      ),
                      SizedBox(height: 15,),
                      SignupText(
                        onTap: () {
                        Get.toNamed('/signupScreen');
                        },
                      ),
                      SizedBox(height: 20,)


                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
  );
}
}
