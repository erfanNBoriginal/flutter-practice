import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_go_router/modules/home/cubit/home_cubit.dart';
import '/domains/store/store_repository.dart';
import '/modules/favorites/cubit/favorites_cubit.dart';
import '/modules/shop_cart/cubit/shop_cart_cubit.dart';
import '../../domains/store/models/product.dart';
import '/ui_kit/ui_kit.dart' as U;

class ProductBottomSheet extends StatelessWidget {
  //
  static show(
    BuildContext context, {
    required Product product,
    bool useRootNavigator = false,
    FavoritesCubit? favoritesCubit,
    ShopCartCubit? shopCartCubit,
  }) {
    U.BottomSheet.show(
      context,
      useRootNavigator: useRootNavigator,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            favoritesCubit == null
                ? BlocProvider(
                    create: (context) => FavoritesCubit(
                      storeRepo: RepositoryProvider.of<StoreRepository>(
                        context,
                      ),
                    ),
                  )
                : BlocProvider.value(value: favoritesCubit),
            shopCartCubit == null
                ? BlocProvider(
                    create: (context) => ShopCartCubit(
                      storeRepo: RepositoryProvider.of<StoreRepository>(
                        context,
                      ),
                    ),
                  )
                : BlocProvider.value(value: shopCartCubit),
          ],
          child: MultiBlocListener(
            listeners: [
              BlocListener<FavoritesCubit, FavoritesState>(
                listenWhen: (previous, current) =>
                    previous.favorites.length != current.favorites.length,
                listener: (context, state) {
                  context
                      .read<HomeCubit>()
                      .onFavsCountChanged(state.favorites.length);
                },
              ),
              BlocListener<ShopCartCubit, ShopCartState>(
                listenWhen: (previous, current) =>
                    previous.shopItems.length != current.shopItems.length,
                listener: (context, state) {
                  context
                      .read<HomeCubit>()
                      .onShopItemsCountChanged(state.shopItems.length);
                },
              ),
            ],
            child: ProductBottomSheet(product: product),
          ),
        );
      },
    );
  }

  final Product product;

  const ProductBottomSheet({super.key, required this.product});

  //
  @override
  Widget build(BuildContext context) {
    final favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
    final shopCartCubit = BlocProvider.of<ShopCartCubit>(context);
    return Stack(
      children: [
        ListView(
          children: [
            U.Image(path: product.image, height: 300, width: 300),
            const SizedBox(height: 25),
            Row(
              children: [
                Column(
                  children: [
                    U.Text(
                      product.title,
                      size: U.TextSize.s16,
                      weight: U.TextWeight.bold,
                    ),
                    const SizedBox(height: 2),
                    U.Text(
                      product.categoryData.title,
                      size: U.TextSize.s12,
                      color: U.Theme.outline2,
                      weight: U.TextWeight.regular,
                    ),
                  ],
                ),
                const Spacer(),
                BlocBuilder<FavoritesCubit, FavoritesState>(
                  builder: (context, state) {
                    return U.IconButton(
                      disabled: state.loading,
                      color: Colors.transparent,
                      icon: Icon(
                        size: 24,
                        state.favorites.contains(product)
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                      onPressed: () =>
                          favoritesCubit.onFavoriteButtonTapped(product),
                    );
                  },
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
                  product.rating.toString(),
                  size: U.TextSize.s14,
                  weight: U.TextWeight.medium,
                ),
                Icon(Icons.star, size: 14, color: Color(0xFFFFBB00)),
                const Spacer(),
                SizedBox(
                  height: 30,
                  child: VerticalDivider(width: 28, thickness: 1),
                ),
                U.Text(
                  'قیمت: ',
                  size: U.TextSize.s14,
                  weight: U.TextWeight.medium,
                ),
                const Spacer(),
                U.Text(
                  'تومان ${product.price}',
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
            U.Text(product.description),
            const SizedBox(height: 80),
          ],
        ),
        BlocBuilder<ShopCartCubit, ShopCartState>(
          builder: (context, state) {
            final shopItem =
                state.shopItems.where((e) => e.product == product).firstOrNull;
            final shopItemCount = shopItem?.count ?? 0;
            // final shopItemCount = shopItem?.count ?? 0;
            return Positioned(
              left: 8,
              right: 8,
              bottom: 16,
              height: 60,
              child: shopItemCount <= 0
                  ? U.Button(
                      title: 'افزودن به سبد خرید',
                      size: U.ButtonSize.lg,
                      color: U.ButtonColor.primary,
                      onPressed: () =>
                          shopCartCubit.onAddToShopCartPressed(product),
                    )
                  : U.Counter(
                      count: shopItemCount,
                      size: U.CounterSize.large,
                      onIncresePressed: () =>
                          shopCartCubit.onAddToShopCartPressed(product),
                      onDecresePressed: () =>
                          shopCartCubit.onRemoveFromShopCartPressed(
                        product,
                      ),
                    ),
            );
          },
        ),
      ],
    );
  }
}
