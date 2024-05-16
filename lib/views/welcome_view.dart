import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:treasure_book/const/app_colors.dart';
import 'package:treasure_book/const/custome_text.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: constraints.maxHeight * 0.6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/welcome.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    headingText("Welcome"),
                    SizedBox(height: 10,),
                    normalText(
                        "Within this treasure book, where words dwell in the embrace of pages, lies the uncharted expanse of wisdom waiting to be unfurled, and dreams eager to take flight."),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Container(
                          width: 65,
                          height: 65,
                          child: FloatingActionButton(
                            onPressed: () {
                              Get.toNamed('/loginScreen');
                              print('yes');
                            },
                            backgroundColor: Appcolor.orange,
                            foregroundColor: Appcolor.white,
                            child:SvgPicture.asset(
                                'assets/icons/chevron-right.svg'),
                          ),
                        ),
                      ),
                    ),
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
