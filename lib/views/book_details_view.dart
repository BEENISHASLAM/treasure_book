import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:treasure_book/const/custom_button.dart';

import '../const/app_colors.dart';
import '../const/custome_text.dart';

class BookDetailView extends StatelessWidget {
   BookDetailView({Key? key}) : super(key: key);
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.black,
      appBar: AppBar(
        backgroundColor: Appcolor.black,
        title:heading(data.name),
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
                  //mainAxisAlignment: MainAxisAlignment.center,
                 // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    Center(
                      child: SizedBox(
                        height: 320,
                        child:
                        Image.asset(data.images,
                          fit:BoxFit.cover,
                        ),),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Appcolor.grey
                      ),
                        child:normalText(data.author)),
                    Spacer(),
                    SizedBox(
                      width:140,
                      height: 50,
                      child:
                    CustomButton(text: "Read more", onPressed:(){})
                      ,)


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
