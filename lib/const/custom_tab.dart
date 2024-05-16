import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treasure_book/const/app_colors.dart';

import '';
class HorizontalButtonList extends StatefulWidget {
  final List<String> categories;
  final Function(String) onCategorySelected;

  HorizontalButtonList({required this.categories, required this.onCategorySelected});

  @override
  _HorizontalButtonListState createState() => _HorizontalButtonListState();
}

class _HorizontalButtonListState extends State<HorizontalButtonList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40, // Set the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = index;
                });
                widget.onCategorySelected(widget.categories[index]);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                side: MaterialStateProperty.all(
                  BorderSide(color: _selectedIndex == index ?Appcolor.orange :Appcolor.orange),
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red; // Change to your desired color when pressed
                    }
                    return _selectedIndex == index ?Appcolor.orange : Colors.transparent; // Default colors
                  },
                ),
              ),
              child: Text(widget.categories[index], style: TextStyle(color:Appcolor.lightGrey)),
            ),
          );
        },
      ),
    );
  }
}
