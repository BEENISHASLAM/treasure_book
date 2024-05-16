import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:treasure_book/controllers/forgot_password_controller.dart';

import '../const/app_colors.dart';
import '../const/custom_button.dart';
import '../const/custom_text_field.dart';
import '../const/custome_text.dart';
import '../const/helper_function.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordController controller = Get.put(ForgotPasswordController());
   ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.black,
      appBar: AppBar(
        backgroundColor: Appcolor.black,
        title:heading("Forgot password"),
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
                  key: controller.globalKeyForm,
                  child: Column(
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
                      heading("Don't Worry!!!"),
                      SizedBox(height: 10,),
                      normalText1("Please enter registered Email address"),
                      SizedBox(height: 40,),
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
                      SizedBox(height: 10,),
                      TextButton(onPressed: (){
                        Get.toNamed('/loginScreen');
                      }, child:normalText1("Back to Sign in")),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:15.0),
                        child: CustomButton(
                            text: "Send Code", onPressed:(){
                              controller.resetPassword();

                        }),
                      ),




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
