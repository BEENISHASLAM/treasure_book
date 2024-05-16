import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:treasure_book/const/custom_button.dart';

import '../const/app_colors.dart';
import '../const/custome_text.dart';

class OTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.black,
        appBar: AppBar(
          backgroundColor: Appcolor.black,
          title:heading("OTP Verification"),
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
      body:LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
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
                    heading("Enter OTP"),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: normalText1("Enter Verification code we just sent on your Email address "),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        cursorColor: Appcolor.grey,
                        textStyle:TextStyle(color: Appcolor.lightGrey) ,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 70,
                          fieldWidth: 70,
                          selectedColor: Appcolor.lightGrey,
                          inactiveColor: Appcolor.lightGrey,
                          activeColor: Appcolor.lightGrey,
                          disabledColor: Appcolor.lightGrey,
                          inactiveFillColor: Appcolor.lightGrey,
                          selectedFillColor: Appcolor.lightGrey,
                        ),
                        onChanged: (value) {
                          // Handle OTP input
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        normalText1('Didn\'t receive code?'),
                        TextButton(
                          onPressed: () {
                            // Resend OTP logic
                          },
                          child:normalText1('Resend'),
                        ),
                      ],
                    ),

                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:15.0),
                      child: CustomButton(
                          text: "Verify", onPressed:(){
                      }),
                    ),
                    SizedBox(height: 5,),




                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

