import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/modules/favorites/cubit/favorites_cubit.dart';
import '../../domains/store/models/product.dart';
import '/modules/store/product_btms.dart';
import '/ui_kit/ui_kit.dart' as U;

class FavoritesCard extends StatelessWidget {
  //
  final Product product;

  const FavoritesCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final favCubit = BlocProvider.of<FavoritesCubit>(context);
    return GestureDetector(
      onTap: () {
        ProductBottomSheet.show(
          context,
          product: product,
          favoritesCubit: favCubit,
        );
      },
      child: U.Card(
        height: 140,
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              child: Image.asset(product.image, fit: BoxFit.contain),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  U.Text(
                    product.title,
                    size: U.TextSize.s14,
                    weight: U.TextWeight.bold,
                  ),
                  U.Text(
                    product.categoryData.title,
                    size: U.TextSize.s12,
                    weight: U.TextWeight.regular,
                  ),
                  U.Text(
                    '${product.price} تومان',
                    size: U.TextSize.s12,
                    weight: U.TextWeight.regular,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(width: 5),
            U.IconButton(
              icon: const Icon(Icons.favorite, color: U.Theme.primary),
              onPressed: () => favCubit.onFavoriteButtonTapped(product),
            ),
          ],
        ),
      ),
    );
  }
}
