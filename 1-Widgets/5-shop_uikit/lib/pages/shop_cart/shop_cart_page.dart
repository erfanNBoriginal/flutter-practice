import 'package:flutter/material.dart';
import '/models/product.dart';
import '/models/shop_item.dart';
import '/pages/shop_cart/shop_cart_card.dart';

class ShopCartPage extends StatelessWidget {
  //
  final List<Product> favorites;

  final List<ShopItem> shopItems;

  final void Function(Product data) onFavoritesPressed;

  final void Function(Product data) onAddtoCartPressed;

  final void Function(Product data) onRemoveFromCartPressed;

  const ShopCartPage({
    super.key,
    required this.favorites,
    required this.shopItems,
    required this.onFavoritesPressed,
    required this.onAddtoCartPressed,
    required this.onRemoveFromCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: shopItems.length,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemBuilder: (context, index) {
        return ShopCartCard(
          shopItem: shopItems[index],
          favorites: favorites,
          shopItems: shopItems,
          onFavoritesPressed: onFavoritesPressed,
          onAddPressed: onAddtoCartPressed,
          onRemovePressed: onRemoveFromCartPressed,
        );
      },
    );
  }
}
