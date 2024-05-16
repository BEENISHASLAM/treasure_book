import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treasure_book/const/app_colors.dart';
import 'package:treasure_book/const/custome_text.dart';

import '../models/data_model.dart';

class RelatedProduct extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 1,
      name: 'The Treasure',
      users:'20',
      author: "By Selma lagerloef, Arthur",
      images: 'assets/images/Rectangle 83.png',
    ),
    Product(
      id: 2,
      name: 'The Eleventh Hour',
      author: "By Grame Base",
      users:'10',
      images: 'assets/images/book2.png',
    ),

    // Add more products here...
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 250,
        // Set the height of the horizontal list
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) => ProductItem(
            key: ValueKey(products[index].id),
            product: products[index],
          ),
        ),
      ),

    );
  }
}



class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child:InkWell(
        onTap:(){
          Get.toNamed('/detailsScreen', arguments: product);
          print(product.name);
        },
        child: Stack(
          clipBehavior: Clip.none, alignment: Alignment.topCenter, // Allow the image to be drawn outside the Stack
          children: [
            Container(
              width: 170,
              height: 220,
              color:Appcolor.grey,
            ),
            Positioned(
              top: -25, // Adjust this value to move the image up or down
              child: Image.asset(
                product.images, // URL of the image
                width: 130,
                height:200,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                SizedBox(height: 150),
                // Adjust the height as needed
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    productName(product.name),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color:Appcolor.lightGrey, fontSize: 12.0),
                          children: <InlineSpan>[
                            TextSpan(
                              text: product.users != null ? product.users.toString() : 'N/A',

                            ),
                            WidgetSpan(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: Icon(Icons.remove_red_eye_rounded, color:Appcolor.lightGrey, size: 13.0),
                                  ),
                                  // Adjust the spacing as needed
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 2),
                productTitle(product.author)
              ],
            ),
          ],
        ),
      ),
    );
  }
}








