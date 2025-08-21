import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_go_router/modules/home/cubit/home_cubit.dart';
import '/ui_kit/ui_kit.dart' as U;

class HomeShell extends StatelessWidget {
  //
  final StatefulNavigationShell child;

  final bool hideNavBar;

  const HomeShell({
    super.key,
    required this.hideNavBar,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(builder: (context) {
        final homeCubit = BlocProvider.of<HomeCubit>(context);
        homeCubit.onSelectedIndexChanged(child.currentIndex);
        return Scaffold(
          backgroundColor: U.Theme.background,
          drawer: Container(
            color: Colors.white,
            height: double.infinity,
            width: 200,
          ),
          // bottomNavigationBar: hideNavBar
          //     ? null
          //     : BlocBuilder<HomeCubit, HomeState>(
          //         builder: (context, state) {
          //           return U.NavigationBar(
          //             selectedIndex: child.currentIndex,
          //             destinations: [
          //               U.NavigationDestination(
          //                 title: 'دسته‌بندی',
          //                 icon: U.Icons.category,
          //               ),
          //               U.NavigationDestination(
          //                 title: 'سبدخرید',
          //                 badgeCount: state.shopItemsCount,
          //                 icon: U.Icons.shopCart,
          //               ),
          //               U.NavigationDestination(
          //                 title: 'فروشگاه',
          //                 icon: U.Icons.store,
          //               ),
          //               U.NavigationDestination(
          //                 title: 'علاقه‌مندی‌ها',
          //                 badgeCount: state.favsCount,
          //                 icon: U.Icons.favorites,
          //               ),
          //               U.NavigationDestination(
          //                 title: 'پروفایل',
          //                 icon: U.Icons.profile,
          //               ),
          //             ],
          //             onDestinationChanged: child.goBranch,
          //           );
          //         },
          //       ),
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(child: child),
              AnimatedPositioned(
                bottom: hideNavBar ? -70 : 0,
                left: 0,
                right: 0,
                duration: U.Theme.secondaryDuration,
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return U.NavigationBar(
                      selectedIndex: child.currentIndex,
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
                      onDestinationChanged: child.goBranch,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
    // );
  }
}
