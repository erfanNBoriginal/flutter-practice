import 'package:flutter/material.dart';
import 'package:shop_m3/models/product.dart';
import 'package:shop_m3/models/shop_item.dart';
import 'package:shop_m3/pages/store/product_btms.dart';

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
    final theme = Theme.of(context);
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
        height: 320,
        width: 200,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.asset(data.image),
                // const Size
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        data.title,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 1,
                ),
                Row(
                  children: [
                    Text(
                      'Rating: ${data.rating}',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.colorScheme.outline,
                      ),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    IconButton.filledTonal(
                      onPressed: () => onAddtoCartPressed(data),
                      icon: Icon(Icons.add),
                    ),
                    const Spacer(),
                    Text(
                      '\$${data.price}',
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
