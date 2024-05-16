import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:treasure_book/const/app_colors.dart';


class HomeController extends GetxController {
  final TextEditingController   authorController  = TextEditingController();
  final TextEditingController   categoryController  = TextEditingController();
  final TextEditingController   nameController  = TextEditingController();


  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.toNamed('/homeScreen');
        break;
      case 1:
        Get.toNamed('/favoritesScreen');
        break;
      case 2:
        Get.toNamed('/profileScreen');
        break;
    }
  }

  Uint8List? _imageBytes;

  Uint8List? get imageBytes => _imageBytes;

  void pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageBytes = await pickedImage.readAsBytes();
      _imageBytes = imageBytes;
      update(); // Notify listeners that the image has been picked
    }
  }






  DatabaseReference _database = FirebaseDatabase.instance.reference();




  void submitForm() async {
    String bookAuthor = authorController.text;
    String bookName = nameController.text;
    String category = nameController.text;

    // Encode the image bytes to base64
    String imageBase64 = _imageBytes != null ? base64Encode(_imageBytes!) : '';

    _database.child('Books').push().set({
      'author_name': bookAuthor,
      'image_base64': imageBase64,
      'book_name': bookName,
      'book_category': category,
    });

    // Clear the text fields after submission
    authorController.clear();
    nameController.clear();
    _imageBytes = null;
    update();
    Get.snackbar("Adedd", 'Book add sucefully',
    colorText: Appcolor.white,
      backgroundColor: Appcolor.green,

    );// Notify listeners that the form has been submitted
  }


















// var _selectedIndex = 0.obs;
  //
  // void changePage(int index) {
  //   _selectedIndex.value = index;
  //   print(selectedIndex);
  //   RxString selectedCategory = ''.obs;
  //
  //   void selectCategory(String category) {
  //     selectedCategory.value = category;
  //   }
  //
  //
  //   switch (index) {
  //     case 0:
  //       Get.toNamed('/homeScreen');
  //       break;
  //     case 1:
  //       Get.toNamed('/favoritesScreen');
  //       break;
  //     case 2:
  //       Get.toNamed('/profileScreen');
  //       break;
  //   }
  // }
  //
  // int get selectedIndex => _selectedIndex.value;


}






