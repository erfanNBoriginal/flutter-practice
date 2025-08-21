import 'package:flutter/material.dart';
import 'package:shop_m3/models/product.dart';
import 'package:shop_m3/models/shop_item.dart';
import 'package:shop_m3/pages/favorites/favorites_card.dart';

class FavoritesPage extends StatelessWidget {
  //
  final List<Product> favorites;

  final List<ShopItem> shopItems;

  final void Function(Product data) onFavoritesPressed;

  final void Function(Product data) onAddtoCartPressed;

  final void Function(Product data) onRemoveFromCartPressed;

  const FavoritesPage({
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
      itemCount: favorites.length,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemBuilder: (context, index) {
        final data = favorites[index];
        return FavoritesCard(
          product: data,
          favorites: favorites,
          shopItems: shopItems,
          onAddtoCartPressed: onAddtoCartPressed,
          onRemoveFromCartPressed: onRemoveFromCartPressed,
          onFavoritesPressed: (_) {
            onFavoritesPressed(data);
          },
        );
      },
    );
  }
}
