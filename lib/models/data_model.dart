class Product {
  final int id;
  final String name;
  final String author;
  final String images;
  final String? users;

  Product({
    this.users,
    required this.id,
    required this.name,
    required this.author,
    required this.images,
  });
}