import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../const/app_colors.dart';
import '../const/custome_text.dart';
import '../controllers/favorite.dart';

class FavoritesView  extends StatelessWidget {
   FavoritesView ({Key? key}) : super(key: key);
  final FavoritesController favoritesController = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.black,
      appBar: AppBar(
        backgroundColor: Appcolor.black,
        title:heading("Favorites"),
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
      body:Column(children: [
        SizedBox(height: 20,),
        Container(
          height:500,
          child:
      Obx(() {
        final favorites = favoritesController.favorites;
        return favorites.isEmpty
            ? Center(child: Text('No favorites yet'))
            : ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final product = favorites[index];
            return Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Appcolor.orange, // specify the border color here
                  width: 1, // specify the border width here
                ),


              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Container(
                    child:Image.asset(
                      product.images,
                      width: 100,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      productName(product.name),
                      productTitle(product.author),

                    ],
                  ),
                   IconButton(
                  icon: Icon(Icons.favorite, color: Appcolor.orange,),
                  onPressed: () {
                    favoritesController.removeFromFavorites(product);
                  },
                ),

                ],)
                // child: ListTile(
                //   title: Text(product.name),
                //   subtitle: Text(product.author),
                //   leading: Image.asset(
                //     product.images,
                //     width: 100,
                //     height: 400,
                //     fit: BoxFit.cover,
                //   ),
                //   trailing: IconButton(
                //     icon: Icon(Icons.favorite, color: Appcolor.orange,),
                //     onPressed: () {
                //       favoritesController.removeFromFavorites(product);
                //     },
                //   ),
                // ),
              ),
            );
          },
        );
      }),)])
    );
  }
}




