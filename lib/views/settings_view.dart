import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../const/app_colors.dart';
import '../const/custome_text.dart';

class SettingsView  extends StatelessWidget {
const SettingsView ({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Appcolor.black,
      appBar: AppBar(
        backgroundColor: Appcolor.black,
        title:heading("Settings"),
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
                        child: Column(children: [
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child:headingText("General") ,),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 60,
                              decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:Appcolor.grey
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 20,),
                                  SvgPicture.asset('assets/icons/rating.svg'),
                                  SizedBox(width: 50,),
                                  normalText("Feedback"),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: SvgPicture.asset('assets/icons/backarrow.svg',width: 8,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 140,
                              decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:Appcolor.grey
                              ),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 20,),
                                      SvgPicture.asset('assets/icons/share.svg'),
                                      SizedBox(width: 50,),
                                      normalText("Share"),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: SvgPicture.asset('assets/icons/backarrow.svg',width: 8,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 20,),
                                      SvgPicture.asset('assets/icons/more.svg'),
                                      SizedBox(width: 50,),
                                      InkWell(
                                          onTap: (){
                                            Get.toNamed('/aboutUsScreen');
                                          },
                                          child: normalText("About Us")),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: SvgPicture.asset('assets/icons/backarrow.svg', width: 8,),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child:headingText("Privacy & Cache ") ,),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 180,
                              decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:Appcolor.grey
                              ),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 20,),
                                      SvgPicture.asset('assets/icons/cache.svg'),
                                      SizedBox(width: 50,),
                                      normalText("Clear Cache"),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: SvgPicture.asset('assets/icons/backarrow.svg',width: 8,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 35,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 20,),
                                      SvgPicture.asset('assets/icons/privacy.svg'),
                                      SizedBox(width: 50,),
                                      normalText("Privacy Policy"),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: SvgPicture.asset('assets/icons/backarrow.svg', width: 8,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 35,),
                                  InkWell(
                                    onTap: (){
                                      Get.toNamed('/changePasswordScreen');
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(width: 20,),
                                        SvgPicture.asset('assets/icons/privacy.svg'),
                                        SizedBox(width: 50,),
                                        normalText("Change Password"),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: SvgPicture.asset('assets/icons/backarrow.svg', width: 8,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),

                        ],))));}));
}
}
