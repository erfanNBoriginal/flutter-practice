import 'package:flutter/material.dart';
import 'package:shop_m3/models/product.dart';
import 'package:shop_m3/models/shop_item.dart';
import 'package:shop_m3/pages/store/product_btms.dart';

class ShopCartCard extends StatelessWidget {
  //

  final ShopItem shopItem;

  final List<Product> favorites;

  final List<ShopItem> shopItems;

  final void Function(Product data) onFavoritesPressed;

  final void Function(Product data) onAddPressed;

  final void Function(Product data) onRemovePressed;

  const ShopCartCard({
    super.key,
    required this.shopItem,
    required this.favorites,
    required this.shopItems,
    required this.onFavoritesPressed,
    required this.onAddPressed,
    required this.onRemovePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ProductBottomSheet.show(
          context,
          product: shopItem.product,
          favorites: favorites,
          shopItems: shopItems,
          onFavoritesPressed: onFavoritesPressed,
          onAddtoCartPressed: onAddPressed,
          onRemoveFromCartPressed: onRemovePressed,
        );
      },
      child: SizedBox(
        height: 200,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                SizedBox(
                  height: 120,
                  child: Image.asset(
                    shopItem.product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shopItem.product.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        shopItem.product.categoryData.title,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$${(shopItem.count * shopItem.product.price)}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton.filledTonal(
                          onPressed: () => onRemovePressed(shopItem.product),
                          icon: Icon(Icons.remove),
                        ),
                        const SizedBox(width: 4),
                        SizedBox(
                          width: 40,
                          child: Text(
                            shopItem.count.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        IconButton.filledTonal(
                          onPressed: () => onAddPressed(shopItem.product),
                          icon: Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
