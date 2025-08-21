import 'package:flutter/material.dart';
import '/models/category.dart';

class CategoryCard extends StatelessWidget {
  //
  final CategoryData data;

  const CategoryCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: 200,
      child: Card(
        color: data.color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(data.image),
              const Spacer(),
              Text(
                data.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
