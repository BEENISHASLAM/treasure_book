import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:treasure_book/const/app_colors.dart';
import 'package:treasure_book/const/custome_text.dart';

import '../controllers/favorite.dart';
import '../models/data_model.dart';

class ProductView extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 1,
      name: 'The Secret',
      author: "By Byron Preiss,Ted Mann",
      images: 'assets/images/product1.png',
    ),
    Product(
      id: 2,
      name: 'The Eleventh Hour',
      author: "By Grame Base",
      images: 'assets/images/product2.png',
    ),
    Product(
      id: 3,
      name: 'The Eleventh Hour',
      author: "By Grame Base",
      images: 'assets/images/product1.png',
    ),
    // Add more products here...
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 220,
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
    final FavoritesController favoritesController = Get.put(FavoritesController());

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                product.images,
                height: 150,
                fit: BoxFit.cover,
              ),
              Positioned(
                right: 0,
                child: InkWell(
                  onTap: () {
                    favoritesController.addToFavorites(product);
                  },
                  child: GetBuilder<FavoritesController>(
                    builder: (builder) => Icon(
                      builder.isFavorite(product) ? Icons.favorite : Icons.favorite_border,
                      color: builder.isFavorite(product) ? Appcolor.orange : Appcolor.orange,
                      size: 25,
                    ),
                  ),
                ),

              ),
            ],
          ),
          SizedBox(height: 8),
          productName(product.name),
          productTitle(product.author),
        ],
      ),
    );
  }
}









