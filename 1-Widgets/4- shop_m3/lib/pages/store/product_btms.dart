import 'package:flutter/material.dart';
import 'package:shop_m3/models/product.dart';
import 'package:shop_m3/models/shop_item.dart';

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
    print('test!');
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxWidth: 600,
        maxHeight: MediaQuery.of(context).size.height * 0.75,
      ),
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

  // bool get isFav1 {
  //   return widget.favorites.any((e) => e == widget.product);
  // }

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
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 8,
                width: 80,
                decoration: BoxDecoration(
                  color: theme.colorScheme.outline,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Stack(
              children: [
                ListView(
                  children: [
                    SizedBox.square(
                      dimension: 350,
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.product.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.product.categoryData.title,
                              style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: onFavoriteTapped,
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Divider(),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'Rating: ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          widget.product.rating.toString(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            width: 12,
                            thickness: 1.5,
                          ),
                        ),
                        Text(
                          'Price: ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        Text('\$${widget.product.price}'),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Divider(),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'Product Detail',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.product.description,
                    ),
                  ],
                ),
                Positioned(
                  left: 8,
                  right: 8,
                  bottom: 16,
                  height: 60,
                  child: count <= 0
                      ? ElevatedButton(
                          onPressed: onAddToShopCartTapped,
                          child: Text('ADD To Cart'),
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
            ),
          ),
        ],
      ),
    );
  }
}
