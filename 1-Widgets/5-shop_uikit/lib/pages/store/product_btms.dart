import 'package:flutter/material.dart';
import '/models/product.dart';
import '/models/shop_item.dart';
import '/ui_kit/ui_kit.dart' as U;

class ProductBottomSheet extends StatefulWidget {
  //
  static show(
    BuildContext context, {
    required Product product,
    required List<Product> favorites,
    required List<ShopItem> shopItems,
    required void Function(Product data) onFavoritesPressed,
    required void Function(Product data) onAddtoCartPressed,
    required void Function(Product data) onRemoveFromCartPressed,
  }) {
    U.BottomSheet.show(
      context,
      builder: (context) {
        return ProductBottomSheet(
          product: product,
          favorites: favorites,
          shopItems: shopItems,
          onFavoriteTapped: onFavoritesPressed,
          onAddToCartPressed: onAddtoCartPressed,
          onRemoveFromCartPressed: onRemoveFromCartPressed,
        );
      },
    );
  }

  final Product product;

  final List<Product> favorites;

  final List<ShopItem> shopItems;

  final void Function(Product data) onFavoriteTapped;

  final void Function(Product data) onAddToCartPressed;

  final void Function(Product data) onRemoveFromCartPressed;

  const ProductBottomSheet({
    super.key,
    required this.product,
    required this.favorites,
    required this.shopItems,
    required this.onFavoriteTapped,
    required this.onAddToCartPressed,
    required this.onRemoveFromCartPressed,
  });

  @override
  State<ProductBottomSheet> createState() => _ProductBottomSheetState();
}

class _ProductBottomSheetState extends State<ProductBottomSheet> {
  //
  bool isFav = false;

  int count = 0;

  void onFavoriteTapped() {
    widget.onFavoriteTapped(widget.product);
    isFav = !isFav;
    setState(() {});
  }

  void onAddToShopCartTapped() {
    widget.onAddToCartPressed(widget.product);
    if (count <= 10) {
      count = count + 1;
      setState(() {});
    }
  }

  void onRemoveFromShopCartTapped() {
    widget.onRemoveFromCartPressed(widget.product);
    if (count > 0) {
      count = count - 1;
      setState(() {});
    }
  }

  @override
  void initState() {
    isFav = widget.favorites.any((e) => e == widget.product);
    final temp =
        widget.shopItems.where((e) => e.product == widget.product).firstOrNull;
    if (temp == null) {
      count = 0;
    } else {
      count = temp.count;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            U.Image(
              path: widget.product.image,
              height: 300,
              width: 300,
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Column(
                  children: [
                    U.Text(
                      widget.product.title,
                      size: U.TextSize.s16,
                      weight: U.TextWeight.bold,
                    ),
                    const SizedBox(height: 2),
                    U.Text(
                      widget.product.categoryData.title,
                      size: U.TextSize.s12,
                      color: U.Theme.outline2,
                      weight: U.TextWeight.regular,
                    ),
                  ],
                ),
                const Spacer(),
                U.IconButton(
                  color: Colors.transparent,
                  icon: Icon(
                    size: 24,
                    isFav ? Icons.favorite : Icons.favorite_border,
                  ),
                  onPressed: onFavoriteTapped,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(),
            const SizedBox(height: 12),
            Row(
              children: [
                U.Text(
                  'امتیاز: ',
                  size: U.TextSize.s14,
                  weight: U.TextWeight.medium,
                ),
                const Spacer(),
                U.Text(
                  widget.product.rating.toString(),
                  size: U.TextSize.s14,
                  weight: U.TextWeight.medium,
                ),
                Icon(
                  Icons.star,
                  size: 14,
                  color: Color(0xFFFFBB00),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    width: 28,
                    thickness: 1,
                  ),
                ),
                U.Text(
                  'قیمت: ',
                  size: U.TextSize.s14,
                  weight: U.TextWeight.medium,
                ),
                const Spacer(),
                U.Text(
                  'تومان ${widget.product.price}',
                  size: U.TextSize.s14,
                  weight: U.TextWeight.medium,
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 12),
            Divider(),
            const SizedBox(height: 12),
            Row(
              children: [
                U.Text(
                  'توضیحات محصول',
                  size: U.TextSize.s14,
                  weight: U.TextWeight.bold,
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 12),
            U.Text(
              widget.product.description,
            ),
            const SizedBox(height: 80),
          ],
        ),
        Positioned(
          left: 8,
          right: 8,
          bottom: 16,
          height: 60,
          child: count <= 0
              ? U.Button(
                  title: 'افزودن به سبد خرید',
                  size: U.ButtonSize.lg,
                  color: U.ButtonColor.primary,
                  onPressed: onAddToShopCartTapped,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filledTonal(
                      onPressed: onRemoveFromShopCartTapped,
                      icon: Icon(
                        Icons.remove,
                      ),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 65,
                      child: Text(
                        count.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 16),
                    IconButton.filledTonal(
                      onPressed: onAddToShopCartTapped,
                      icon: Icon(
                        Icons.add,
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
