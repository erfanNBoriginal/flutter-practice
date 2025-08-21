import 'package:flutter/material.dart';
import '/models/product.dart';
import '/models/shop_item.dart';
import '/pages/store/product_btms.dart';

class FavoritesCard extends StatelessWidget {
//
  final Product product;

  final List<Product> favorites;

  final List<ShopItem> shopItems;

  final void Function(Product data) onFavoritesPressed;

  final void Function(Product data) onAddtoCartPressed;

  final void Function(Product data) onRemoveFromCartPressed;

  const FavoritesCard({
    super.key,
    required this.product,
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
          product: product,
          favorites: favorites,
          shopItems: shopItems,
          onFavoritesPressed: onFavoritesPressed,
          onAddtoCartPressed: onAddtoCartPressed,
          onRemoveFromCartPressed: onRemoveFromCartPressed,
        );
      },
      child: SizedBox(
        height: 140,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        product.categoryData.title,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  onPressed: () => onFavoritesPressed(product),
                  icon: const Icon(Icons.favorite),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
