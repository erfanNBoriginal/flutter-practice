import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/domains/store/store_repository.dart';
import 'package:shop_cubit/modules/app/cubit/app_cubit.dart';
import 'package:shop_cubit/modules/shop_cart/cubit/shop_cart_cubit.dart';
import '/modules/shop_cart/shop_cart_card.dart';
import '/ui_kit/ui_kit.dart' as U;

class ShopCartPage extends StatelessWidget {
  //
  const ShopCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ShopCartCubit(
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
      child: MultiBlocListener(
        listeners: [
          BlocListener<AppCubit, AppState>(
            listenWhen:
                (previous, current) =>
                    previous.selectedIndex != current.selectedIndex,
            listener: (context, state) {
              if (state.selectedIndex == 1) {
                final shopCartCubit = BlocProvider.of<ShopCartCubit>(context);
                shopCartCubit.onRefresh();
              }
            },
          ),
          BlocListener<ShopCartCubit, ShopCartState>(
            listenWhen:
                (previous, current) =>
                    previous.shopItems.length != current.shopItems.length,
            listener: (context, state) {
              final appCubit = context.read<AppCubit>();
              appCubit.onShopItemsCountChanged(state.shopItems.length);
            },
          ),
        ],
        child: BlocBuilder<ShopCartCubit, ShopCartState>(
          builder: (context, state) {
            return state.loading && state.shopItems.isEmpty
                ? Center(
                  child: SizedBox.square(
                    dimension: 30,
                    child: CircularProgressIndicator(),
                  ),
                )
                : state.shopItems.isEmpty
                ? Center(child: U.Text('لیست علاقه‌مندی خالیه!!!'))
                : ListView.separated(
                  itemCount: state.shopItems.length,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                  itemBuilder: (context, index) {
                    final data = state.shopItems[index];
                    return Column(
                      children: [
                        ShopCartCard(shopItem: data),
                        if (state.loading && data == state.shopItems.last) ...[
                          SizedBox(height: 20),
                          Center(
                            child: SizedBox.square(
                              dimension: 30,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ],
                      ],
                    );
                  },
                );
          },
        ),
      ),
    );
  }
}
