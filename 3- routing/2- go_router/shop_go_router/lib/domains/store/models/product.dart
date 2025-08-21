import 'category.dart';

class Product {
  //
  final int id;

  final String image;

  final String title;

  final double rating;

  final String description;

  final int price;

  final CategoryData categoryData;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.rating,
    required this.description,
    required this.price,
    required this.categoryData,
  });
}
