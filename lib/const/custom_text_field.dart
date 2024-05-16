
import 'package:flutter/material.dart';
import 'app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final focus;
  final onValidate;
  final  Widget? suffixIcon;
  CustomTextField({
    required this.hintText,
    this.controller,
    this.icon,
    this.obscureText = false,
    this.focus,
    this.onValidate,
    this.suffixIcon,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color:Appcolor.lightGrey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(vertical:5.0),
      child: Row(
        children: [
          Icon(icon,color:Appcolor.lightGrey,),
          Expanded(
            child:TextFormField(
              validator: onValidate,
              controller: controller,
              cursorColor:Appcolor.lightGrey,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(color: Appcolor.lightGrey),
                suffixIcon: suffixIcon

              ),

              obscureText: obscureText,
              style: TextStyle(color: Appcolor.lightGrey),
            ),
          ),
        ],
      ),
    );
  }
}
