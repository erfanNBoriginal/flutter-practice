import 'package:flutter/material.dart';
import '/models/product.dart';
import '/models/shop_item.dart';
import '/pages/store/product_btms.dart';
import '/ui_kit/ui_kit.dart' as U;

class ProductCard extends StatelessWidget {
  //
  final Product data;

  final List<Product> favorites;

  final List<ShopItem> shopItems;

  final void Function(Product data) onFavoritesPressed;

  final void Function(Product data) onAddtoCartPressed;

  final void Function(Product data) onRemoveFromCartPressed;

  const ProductCard({
    super.key,
    required this.data,
    required this.favorites,
    required this.shopItems,
    required this.onFavoritesPressed,
    required this.onAddtoCartPressed,
    required this.onRemoveFromCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ProductBottomSheet.show(
          context,
          product: data,
          favorites: favorites,
          shopItems: shopItems,
          onFavoritesPressed: onFavoritesPressed,
          onAddtoCartPressed: onAddtoCartPressed,
          onRemoveFromCartPressed: onRemoveFromCartPressed,
        );
      },
      child: SizedBox(
        height: 300,
        width: 200,
        child: U.Card(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              U.Image(
                path: data.image,
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  U.Text(
                    data.title,
                    size: U.TextSize.s14,
                    weight: U.TextWeight.medium,
                  ),
                  Row(
                    children: [
                      U.Text(
                        'امتیاز: ${data.rating}',
                        size: U.TextSize.s12,
                        color: U.Theme.outline2,
                        weight: U.TextWeight.medium,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Color(0xFFFFBB00),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  U.IconButton(
                    size: 35,
                    icon: U.Image.icon(
                      path: U.Icons.add,
                      color: U.Theme.onPrimary,
                    ),
                    color: U.Theme.primary,
                    onPressed: () => onAddtoCartPressed(data),
                  ),
                  const Spacer(),
                  //set the direction
                  U.Text(
                    '${data.price} تومان',
                    size: U.TextSize.s12,
                    weight: U.TextWeight.medium,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
