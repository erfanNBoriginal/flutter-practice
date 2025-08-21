import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/modules/shop_cart/cubit/shop_cart_cubit.dart';
import '../../domains/store/models/product.dart';
import 'product_btms.dart';
import '/ui_kit/ui_kit.dart' as U;

class ProductCard extends StatelessWidget {
  //
  final Product data;

  const ProductCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final shopCartCubit = BlocProvider.of<ShopCartCubit>(context);
    return GestureDetector(
      onTap: () {
        ProductBottomSheet.show(
          context,
          product: data,
          shopCartCubit: shopCartCubit,
        );
      },
      child: SizedBox(
        height: 300,
        width: 200,
        child: U.Card(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              U.Image(path: data.image),
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
                      const SizedBox(width: 2),
                      Icon(Icons.star, size: 16, color: Color(0xFFFFBB00)),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  BlocBuilder<ShopCartCubit, ShopCartState>(
                    buildWhen: (previous, current) =>
                        previous.shopItems != current.shopItems,
                    builder: (context, state) {
                      final shopItemIndex =
                          state.shopItems.indexWhere((e) => e.product == data);
                      final count = shopItemIndex == -1
                          ? 0
                          : state.shopItems[shopItemIndex].count;
                      return U.Badge(
                        count: count,
                        color: U.BadgeColor.secondary,
                        child: U.IconButton(
                          size: 35,
                          icon: U.Image.icon(
                            path: U.Icons.add,
                            color: U.Theme.onPrimary,
                          ),
                          color: U.Theme.primary,
                          onPressed: () =>
                              shopCartCubit.onAddToShopCartPressed(data),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  //set the direction
                  U.Text(
                    '${data.price} تومان',
                    size: U.TextSize.s12,
                    weight: U.TextWeight.medium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
