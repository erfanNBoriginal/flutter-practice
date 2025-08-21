import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_cubit/domains/store/store_repository.dart';
import 'package:shop_cubit/modules/app/cubit/app_cubit.dart';
import 'package:shop_cubit/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_cubit/modules/shop_cart/shop_cart_page.dart';
import '../profile/profile_page.dart';
import '../category/category_page.dart';
import '../favorites/favorites_page.dart';
import '../store/store_page.dart';
import '/ui_kit/ui_kit.dart' as U;

class App extends StatelessWidget {
  //
  const App({super.key});

  //
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => StoreRepository(),
      child: BlocProvider(
        create: (context) => AppCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          ),
          localizationsDelegates: {
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          },
          supportedLocales: [Locale('en', 'UK'), Locale('fa', 'IR')],
          builder: (context, child) {
            return MediaQuery.withNoTextScaling(child: child!);
          },
          locale: Locale('fa', 'IR'),
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.stylus,
              PointerDeviceKind.touch,
              PointerDeviceKind.trackpad,
              PointerDeviceKind.invertedStylus,
            },
          ),
          home: BlocBuilder<AppCubit, AppState>(
            buildWhen:
                (previous, current) =>
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
                          CategoryPage(),
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
          ),
        ),
      ),
    );
  }
}
