import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_navigator/modules/app/cubit/app_cubit.dart';
import 'package:shop_navigator/modules/categories/categories_page.dart';
import 'package:shop_navigator/modules/category/category_page.dart';
import 'package:shop_navigator/modules/favorites/favorites_page.dart';
import 'package:shop_navigator/modules/profile/profile_page.dart';
import 'package:shop_navigator/modules/shop_cart/shop_cart_page.dart';
import 'package:shop_navigator/modules/store/store_page.dart';
import '/ui_kit/ui_kit.dart' as U;

class HomePage extends StatelessWidget {
  //
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      builder: (context, appState) {
        final appCubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          backgroundColor: U.Theme.background,
          drawer: Container(
            color: Colors.white,
            height: double.infinity,
            width: 200,
          ),
          bottomNavigationBar: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return U.NavigationBar(
                selectedIndex: appState.selectedIndex,
                destinations: [
                  U.NavigationDestination(
                    title: 'دسته‌بندی',
                    icon: U.Icons.category,
                  ),
                  U.NavigationDestination(
                    title: 'سبدخرید',
                    badgeCount: state.shopItemsCount,
                    icon: U.Icons.shopCart,
                  ),
                  U.NavigationDestination(
                    title: 'فروشگاه',
                    icon: U.Icons.store,
                  ),
                  U.NavigationDestination(
                    title: 'علاقه‌مندی‌ها',
                    badgeCount: state.favsCount,
                    icon: U.Icons.favorites,
                  ),
                  U.NavigationDestination(
                    title: 'پروفایل',
                    icon: U.Icons.profile,
                  ),
                ],
                onDestinationChanged: appCubit.onSelectedIndexChanged,
              );
            },
          ),
          body: Column(
            children: [
              U.AppBar.primary(
                onMenuPressed: () {},
                onNotifPressed: () {},
              ),
              Expanded(
                child: IndexedStack(
                  index: appState.selectedIndex,
                  children: [
                    Navigator(
                      onGenerateRoute: (settings) {
                        switch (settings.name) {
                          case CategoriesPage.route:
                            return MaterialPageRoute(
                              settings: settings,
                              builder: (context) {
                                return CategoriesPage();
                              },
                            );
                          case CategoryPage.route:
                            return MaterialPageRoute(
                              settings: settings,
                              builder: (context) {
                                return CategoryPage(
                                  categoryId: settings.arguments as int,
                                );
                              },
                            );
                          default:
                            return MaterialPageRoute(
                              settings: settings,
                              builder: (context) {
                                return CategoriesPage();
                              },
                            );
                        }
                      },
                    ),
                    ShopCartPage(),
                    StorePage(),
                    FavoritesPage(),
                    ProfilePage(),
                  ],
                ),
              ),
            ],
          ),
        );
        // );
      },
    );
  }
}
