import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:treasure_book/controllers/login_controller.dart';
import 'package:treasure_book/controllers/profile_controller.dart';
import '../const/app_colors.dart';
import '../const/custome_text.dart';

class MyProfileView  extends StatelessWidget {
  ProfileController controller = Get.put(ProfileController());
   MyProfileView ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.black,
      appBar: AppBar(
        backgroundColor: Appcolor.black,
        title:heading("My Profile"),
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
      Container(
      width:double.infinity,
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/profile.png'), // Your background image path
          fit: BoxFit.cover,
        ),
      ),
        child:
      Image.asset('assets/images/user.png',),
      ),
      SizedBox(height: 20,),
     Obx(() =>headingText(controller.name.value)),
      Obx(() =>normalText1(controller.email.value)),
      SizedBox(height: 40,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Align(
          alignment: Alignment.topLeft,
          child:headingText("Personal Info") ,),
      ),
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 130,
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
                  SvgPicture.asset('assets/icons/user-alt.svg'),
                  SizedBox(width: 50,),
                  normalText("Name"),
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
                  SvgPicture.asset('assets/icons/email.svg'),
                  SizedBox(width: 50,),
                  normalText("Email"),
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
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Align(
          alignment: Alignment.topLeft,
          child:headingText("Others") ,),),
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 130,
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
                  SvgPicture.asset('assets/icons/Book.svg'),
                  SizedBox(width: 50,),
                  normalText("My Books"),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset('assets/icons/backarrow.svg',width: 8,),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              InkWell(
                onTap: (){
                  print("yes");
                  Get.toNamed('/settingScreen');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 20,),
                    SvgPicture.asset('assets/icons/Setting.svg'),
                    SizedBox(width: 50,),
                    normalText("Settings"),
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
      Spacer(),

      Container(
        width: 240,
        child: ElevatedButton(
          onPressed: () {
          },
          style: ElevatedButton.styleFrom(
            primary: Appcolor.orange, // Background color
            padding: EdgeInsets.all(15), // Button padding
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: (){
                  print("logout");
                 controller.logout();
                },
                child: normalText(
                  'Sign Out',
                ),
              ),
              SizedBox(width: 20),
              SvgPicture.asset('assets/icons/exit.svg'), // Icon
              // Space between icon and text
              // Text
            ],
          ),
        ),
      )


    ],))));}));
  }
}
