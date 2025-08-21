import 'package:flutter/material.dart';
import '../../domains/store/models/category.dart';
import '/ui_kit/ui_kit.dart' as U;

class CategoryCard extends StatelessWidget {
  //
  final CategoryData data;

  const CategoryCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: 320,
        width: 200,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: data.color,
          borderRadius: BorderRadius.circular(U.Theme.r15),
        ),
        child: Column(
          children: [
            const Spacer(),
            U.Image(path: data.image, height: 160, width: 160),
            const Spacer(),
            Text(
              data.title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
