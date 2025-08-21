import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/domains/store/store_repository.dart';
import 'package:shop_cubit/modules/app/cubit/app_cubit.dart';
import 'package:shop_cubit/modules/category/category_card.dart';
import 'package:shop_cubit/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_cubit/modules/store/cubit/store_cubit.dart';
import './product_card.dart';
import '/ui_kit/ui_kit.dart' as U;

class StorePage extends StatelessWidget {
  //

  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StoreCubit(
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
        BlocProvider(
          create: (context) => ShopCartCubit(
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ShopCartCubit, ShopCartState>(
            listenWhen: (previous, current) =>
                previous.shopItems.length != current.shopItems.length,
            listener: (context, state) {
              context
                  .read<AppCubit>()
                  .onShopItemsCountChanged(state.shopItems.length);
            },
          ),
          BlocListener<AppCubit, AppState>(
            listenWhen: (previous, current) =>
                previous.selectedIndex != current.selectedIndex,
            listener: (context, state) {
              context.read<ShopCartCubit>().onRefresh();
            },
          ),
        ],
        child: BlocBuilder<StoreCubit, StoreState>(
          builder: (context, state) {
            return ListView(
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: U.SearchInput(
                    controller: TextEditingController(),
                    onSearched: () {
                      print('searching!!!!');
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: U.Image(
                    path: U.Images.banner1,
                    height: 105,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      U.Text(
                        'فروش ویژه',
                        size: U.TextSize.s20,
                        font: U.TextFont.yekan,
                        weight: U.TextWeight.bold,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 88,
                        child: U.TextButton(
                          title: 'همه',
                          size: U.ButtonSize.sm,
                          color: U.ButtonColor.primary,
                          onPressed: () {
                            print('show All');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 320,
                  child: state.loading
                      ? Center(
                          child: SizedBox.square(
                            dimension: 30,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : ListView.separated(
                          itemCount: state.products.length,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, index) {
                            return const SizedBox(width: 16);
                          },
                          itemBuilder: (_, index) {
                            return ProductCard(data: state.products[index]);
                          },
                        ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      U.Text(
                        'دسته بندی',
                        size: U.TextSize.s20,
                        font: U.TextFont.yekan,
                        weight: U.TextWeight.bold,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: state.loading
                      ? Center(
                          child: SizedBox.square(
                            dimension: 30,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : ListView.separated(
                          itemCount: state.categories.length,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, index) {
                            return const SizedBox(width: 16);
                          },
                          itemBuilder: (_, index) {
                            return CategoryCard(data: state.categories[index]);
                          },
                        ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      U.Text(
                        'پرفروش‌ها',
                        size: U.TextSize.s20,
                        font: U.TextFont.yekan,
                        weight: U.TextWeight.bold,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 88,
                        child: U.TextButton(
                          title: 'همه',
                          size: U.ButtonSize.sm,
                          color: U.ButtonColor.primary,
                          onPressed: () {
                            print('show All');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 320,
                  child: state.loading
                      ? Center(
                          child: SizedBox.square(
                            dimension: 30,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : ListView.separated(
                          itemCount: state.products.length,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, index) {
                            return const SizedBox(width: 16);
                          },
                          itemBuilder: (_, index) {
                            return ProductCard(data: state.products[index]);
                          },
                        ),
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
