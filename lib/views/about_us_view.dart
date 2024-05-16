import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../const/app_colors.dart';
import '../const/custome_text.dart';

class AboutUsView  extends StatelessWidget {
  const AboutUsView ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appcolor.black,
        appBar: AppBar(
          backgroundColor: Appcolor.black,
          title:heading("About us "),
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
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    Center(
                      child: Container(
                        width: 100,
                        height:100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/login.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    normalText1('Treasure Book'),
                    SizedBox(height: 10,),
                    normalText1("Developed by appverse-Technologies!!"),
                    SizedBox(height: 30,),
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/images/user.png'),),
                    SizedBox(height: 10,),
                    normalText1("Beenish Aslam"),
                    normalText1("Anab"),
                    normalText1("Ayesha"),
                    SizedBox(height: 10,),
                    normalText1("Flutter Developer"),

                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: normalText1('Lorem Ipsum is simply dummy text of the printing and typesetting '
                          'industry. Lorem Ipsum has been the industry s standard dummy text ever since the '
                          '1500s, when an unknown printer took a galley of type and scrambled it to make a '
                          'type specimen book. It has survived not only five centuries, but also the leap into'),
                    )
                       
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
