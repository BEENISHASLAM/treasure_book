import 'package:get/get.dart';

import '../models/data_model.dart';

class FavoritesController extends GetxController {
  final RxList<Product> _favorites = <Product>[].obs;

  List<Product> get favorites => _favorites.toList();

  void addToFavorites(Product product) {
    _favorites.add(product);
    print(product.name);
  }

  void removeFromFavorites(Product product) {
    _favorites.remove(product);
  }

  bool isFavorite(Product product) {
    return _favorites.contains(product);
  }
}
