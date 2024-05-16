import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomSearchBar extends StatelessWidget {
const CustomSearchBar({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Container(
      width:double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/icons/home.png'), // Your background image path
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: TextStyle(
              color: Appcolor.lightGrey, // Change the color here
            ),
            decoration: InputDecoration(
              hintText: 'Type here to search',
              filled: true,
              hintStyle:TextStyle(
                  color: Appcolor.lightGrey
              ),
              fillColor:Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:  BorderSide(color:Appcolor.orange, width: 2.0),
              ),
              suffixIcon: Icon(Icons.search,color: Appcolor.lightGrey,),
            ),
          ),),));
}
}
