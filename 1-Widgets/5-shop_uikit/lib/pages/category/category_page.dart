import 'package:flutter/material.dart';
import '/models/category.dart';
import '/pages/category/category_card.dart';

class CategoryPage extends StatelessWidget {
  //
  final List<CategoryData> categories;

  const CategoryPage({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: (size.width / 200).floor(),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      childAspectRatio: 200 / 320,
      children: categories.map((e) => CategoryCard(data: e)).toList(),
    );
  }
}
