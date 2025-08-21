import 'package:flutter/material.dart';
import 'package:shop_m3/models/product.dart';
import 'package:shop_m3/models/shop_item.dart';
import 'package:shop_m3/pages/store/product_card.dart';
import 'package:shop_m3/pages/app_page.dart';

class StorePage extends StatelessWidget {
  //
  final List<Product> favorites;

  final List<ShopItem> shopItems;

  final void Function(Product data) onFavoritesPressed;

  final void Function(Product data) onAddtoCartPressed;

  final void Function(Product data) onRemoveFromCartPressed;

  const StorePage({
    super.key,
    required this.favorites,
    required this.shopItems,
    required this.onFavoritesPressed,
    required this.onAddtoCartPressed,
    required this.onRemoveFromCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
              ),
              hintText: 'Search Here',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                'Exclusive Offers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 320,
          child: ListView.separated(
            itemCount: products.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, index) {
              return const SizedBox(
                width: 16,
              );
            },
            itemBuilder: (_, index) {
              return ProductCard(
                data: products[index],
                favorites: favorites,
                shopItems: shopItems,
                onFavoritesPressed: onFavoritesPressed,
                onAddtoCartPressed: onAddtoCartPressed,
                onRemoveFromCartPressed: onRemoveFromCartPressed,
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                'Exclusive Offers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 320,
          child: ListView.separated(
            itemCount: products.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, index) {
              return const SizedBox(
                width: 16,
              );
            },
            itemBuilder: (_, index) {
              return ProductCard(
                data: products[index],
                favorites: favorites,
                shopItems: shopItems,
                onFavoritesPressed: onFavoritesPressed,
                onAddtoCartPressed: onAddtoCartPressed,
                onRemoveFromCartPressed: onRemoveFromCartPressed,
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: [
  //
  //       ],
  //     ),
  //   );
  // }
}
