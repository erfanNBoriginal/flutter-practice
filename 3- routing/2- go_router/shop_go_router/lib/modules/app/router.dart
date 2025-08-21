import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_go_router/domains/store/models/category.dart';
import 'package:shop_go_router/modules/app/transitions.dart';
import 'package:shop_go_router/modules/categories/categories_page.dart';
import 'package:shop_go_router/modules/category/category_page.dart';
import 'package:shop_go_router/modules/favorites/favorites_page.dart';
import 'package:shop_go_router/modules/home/home_shell.dart';
import 'package:shop_go_router/modules/page_a/page_a.dart';
import 'package:shop_go_router/modules/page_b/page_b.dart';
import 'package:shop_go_router/modules/page_c/page_c.dart';
import 'package:shop_go_router/modules/page_d/page_d.dart';
import 'package:shop_go_router/modules/page_f/page_f.dart';
import 'package:shop_go_router/modules/profile/profile_page.dart';
import 'package:shop_go_router/modules/shop_cart/checkout_page.dart';
import 'package:shop_go_router/modules/shop_cart/shop_cart_page.dart';
import 'package:shop_go_router/modules/store/store_page.dart';

final rootNavKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: StorePage.route,
  navigatorKey: rootNavKey,
  redirect: (context, state) {
    print('state.fullPath');
    print(state.fullPath);
    print('state.uri.scheme');
    print(state.uri.scheme);
    print('state.uri.host');
    print(state.uri.host);
    print('state.uri.port');
    print(state.uri.port);
    print('state.uri.path');
    print(state.uri.path);
    return null;
  },
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeShell(
          hideNavBar:
              // [
              //   CheckoutPage.route,
              //   CategoryPage.route,
              // ].contains(state.topRoute?.name ?? ''),
              [
            CheckoutPage.route,
            CategoryPage.route,
          ].any(
            (e) => e.contains(state.topRoute?.name ?? ''),
          ),
          // state.fullPath!.contains('${CategoriesPage.route}/'),
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: CategoriesPage.route,
              name: CategoriesPage.route,
              builder: (context, state) {
                return CategoriesPage();
              },
              routes: [
                GoRoute(
                  path: CategoryPage.route,
                  name: CategoryPage.route,
                  pageBuilder: (context, state) {
                    return GoNoTransition(
                      key: state.pageKey,
                      child: CategoryPage(
                        data: state.extra as CategoryData?,
                        categoryId: int.parse(
                          state.pathParameters['id']!,
                        ),
                      ),
                    );
                  },
                  // builder: (context, state) {
                  //   return CategoryPage(
                  //     categoryId: int.parse(
                  //       state.pathParameters['id']!,
                  //     ),
                  //   );
                  // },
                ),
              ],
            )
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              routes: [
                GoRoute(
                  path: CheckoutPage.route,
                  name: CheckoutPage.route,
                  pageBuilder: (context, state) {
                    return GoNoTransition(
                        child: CheckoutPage(), key: state.pageKey);
                  },
                )
              ],
              path: ShopCartPage.route,
              name: ShopCartPage.route,
              builder: (context, state) {
                return ShopCartPage();
              },
            )
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: StorePage.route,
              name: StorePage.route,
              builder: (context, state) {
                print('state.uri.queryParameters[pid]');
                print(state.uri.queryParameters['pid']);
                return StorePage(
                  initialProductId: int.tryParse(
                    state.uri.queryParameters['pid'] ?? '',
                  ),
                );
              },
            )
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: FavoritesPage.route,
              name: FavoritesPage.route,
              builder: (context, state) {
                return FavoritesPage();
              },
            )
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ProfilePage.route,
              name: ProfilePage.route,
              builder: (context, state) {
                return ProfilePage();
              },
            )
          ],
        ),
      ],
    ),
    GoRoute(
      path: PageA.route,
      name: PageA.route,
      pageBuilder: (context, state) {
        return GoSlideUpTransition(
          key: state.pageKey,
          child: PageA(content: ''),
        );
      },
      // builder: (context, state) {
      //   return PageA(content: 'static content');
      // },
      routes: [
        GoRoute(
          path: PageB.route,
          name: PageB.route,
          pageBuilder: (context, state) {
            return GoSlideUpTransition(
              key: state.pageKey,
              child: PageB(content: ''),
            );
          },
        ),
      ],
    ),
    ShellRoute(
      builder: (context, state, child) {
        return PageC(
          content: 'static content',
          childPage: child,
        );
      },
      routes: [
        GoRoute(
          path: PageD.route,
          name: PageD.route,
          builder: (context, state) {
            return PageD(content: 'static content');
          },
        ),
        GoRoute(
          path: PageF.route,
          name: PageF.route,
          builder: (context, state) {
            return PageF(content: 'static content');
          },
        ),
      ],
    ),
  ],
);
