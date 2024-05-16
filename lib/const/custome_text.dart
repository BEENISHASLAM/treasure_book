


import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

Widget headingText(String? title){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.w500,color:Appcolor.orange,fontSize: 22.0),);
}
Widget heading(String? title){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.w700,color:Appcolor.lightGrey,fontSize: 20.0),);
}
Widget productName(String? title){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.w700,color:Appcolor.orange,fontSize: 12.0),);
}


Widget normalText(String? title,){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.normal,color:Appcolor.white,fontSize: 16.0, ) ,textAlign: TextAlign.center,);
}
Widget normalText1(String? title,){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.normal,color:Appcolor.lightGrey,fontSize: 15.0, ));
}
Widget productTitle(String? title,){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.normal,color:Appcolor.lightGrey,fontSize: 11.0, ));
}
