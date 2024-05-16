
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:treasure_book/const/app_colors.dart';
import 'package:treasure_book/const/custom_button.dart';
import 'package:treasure_book/const/custome_text.dart';
import 'package:treasure_book/controllers/chnage_password_controller.dart';
import '../const/custom_text_field.dart';
import '../const/helper_function.dart';
class ChangePasswordView extends StatelessWidget {
  ChangePassController controller = Get.put(ChangePassController());
 ChangePasswordView({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Appcolor.black,
    appBar: AppBar(
      backgroundColor: Appcolor.black,
      title:heading("Change Password"),
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
              child:Form(
                key:controller.globalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: normalText1("New Password must be unique from previously used."),
                    ),
                    SizedBox(height: 25,),
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
                          child: CustomTextField(
                            controller: controller.currentPassController,
                            focus: controller.currentPassFocus,
                            hintText: "xyhJk&*er#?12%",
                            onValidate:(str){
                              return HelperFunction.checkPassword(str);
                            },

                            suffixIcon: Image.asset(
                              'assets/icons/eye.png',
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
                              child: normalText1("Confrim Password")),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:15.0),
                          child: Obx(() =>CustomTextField(
                            controller: controller.newPassController,
                            focus: controller.newPasswordFocus,
                            obscureText:controller.obscureText.value,
                            hintText: "......",
                            onValidate:(str){
                              return HelperFunction.checkPassword(str);
                            },

                              suffixIcon:IconButton(
                                  onPressed:(){controller.showPassword();},
                                  icon:Icon(controller.suffixIcon.value, color: Appcolor.lightGrey,))

                          )),
                        ),

                      ],),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:15.0),
                      child: CustomButton(
                          text: "Reset Password", onPressed:(){
                            String oldPassword = controller.currentPassController.text;
                            String newPassword = controller.newPassController.text;
                             controller.changePassword(oldPassword, newPassword);
                      }),
                    ),
                    SizedBox(height: 5,)


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
