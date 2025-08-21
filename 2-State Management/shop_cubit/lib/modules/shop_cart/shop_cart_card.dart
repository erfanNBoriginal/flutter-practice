import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/modules/shop_cart/cubit/shop_cart_cubit.dart';
import '../../domains/store/models/shop_item.dart';
import '/modules/store/product_btms.dart';
import '/ui_kit/ui_kit.dart' as U;

class ShopCartCard extends StatelessWidget {
  //

  final ShopItem shopItem;

  const ShopCartCard({super.key, required this.shopItem});

  @override
  Widget build(BuildContext context) {
    final shopCartCubit = BlocProvider.of<ShopCartCubit>(context);
    return GestureDetector(
      onTap: () {
        ProductBottomSheet.show(
          context,
          product: shopItem.product,
          shopCartCubit: shopCartCubit,
        );
      },
      child: U.Card(
        height: 140,
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              child: Image.asset(shopItem.product.image, fit: BoxFit.cover),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  U.Text(
                    shopItem.product.title,
                    size: U.TextSize.s16,
                    weight: U.TextWeight.bold,
                  ),
                  U.Text(
                    shopItem.product.categoryData.title,
                    size: U.TextSize.s12,
                    weight: U.TextWeight.regular,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                U.Counter(
                  count: shopItem.count,
                  onIncresePressed:
                      () => shopCartCubit.onAddToShopCartPressed(
                        shopItem.product,
                      ),
                  onDecresePressed:
                      () => shopCartCubit.onRemoveFromShopCartPressed(
                        shopItem.product,
                      ),
                ),
                const SizedBox(height: 6),

                U.Text(
                  '${(shopItem.count * shopItem.product.price)} تومان',
                  size: U.TextSize.s14,
                  weight: U.TextWeight.medium,
                ),
                // const SizedBox(height: 8),
                // Row(
                //   children: [
                //     IconButton.filledTonal(
                //       onPressed: () => onRemovePressed(shopItem.product),
                //       icon: Icon(Icons.remove),
                //     ),
                //     const SizedBox(width: 4),
                //     SizedBox(
                //       width: 40,
                //       child: Text(
                //         shopItem.count.toString(),
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //           fontSize: 14,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //     const SizedBox(width: 4),
                //     IconButton.filledTonal(
                //       onPressed: () => onAddPressed(shopItem.product),
                //       icon: Icon(Icons.add),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
