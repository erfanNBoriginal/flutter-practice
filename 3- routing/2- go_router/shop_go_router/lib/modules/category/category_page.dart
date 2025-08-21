import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_go_router/domains/store/models/category.dart';
import 'package:shop_go_router/modules/category/category_filter_btms.dart';
import 'package:shop_go_router/modules/page_b/page_b.dart';
import 'package:shop_go_router/modules/page_f/page_f.dart';
import '/domains/store/store_repository.dart';
import '/modules/category/cubit/category_cubit.dart';
import '/modules/shop_cart/cubit/shop_cart_cubit.dart';
import '/modules/store/product_card.dart';
import '/ui_kit/ui_kit.dart' as U;

class CategoryPage extends StatelessWidget {
  //
  static const route = '/category/:id';

  final int categoryId;

  final CategoryData? data;

  const CategoryPage({
    super.key,
    this.data,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Hero(
      tag: 'category$categoryId',
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoryCubit(
              storeRepo: context.read<StoreRepository>(),
              id: categoryId,
              initialData: data,
            ),
          ),
          BlocProvider(
            create: (context) => ShopCartCubit(
              storeRepo: context.read<StoreRepository>(),
            ),
          ),
        ],
        child: Scaffold(
          backgroundColor: U.Theme.background,
          body: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              final categoryCubit = context.read<CategoryCubit>();
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                color: state.category?.color.withValues(alpha: 0.5) ??
                    U.Theme.background,
                child: Column(
                  children: [
                    U.AppBar.secondary(
                      title: state.category?.title ?? 'دسته بندی',
                      action: U.IconButton(
                        icon: U.Image(
                          path: U.Icons.filter,
                        ),
                        onPressed: () {
                          CategoryBottomSheet.show(
                            context,
                            categoryCubit: categoryCubit,
                          );
                        },
                      ),
                      onBackPressed: () {
                        GoRouter.of(context).goNamed(PageF.route);
                        // Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    U.SearchInput(
                      controller: TextEditingController(),
                      onSearched: () {},
                    ),
                    Expanded(
                      child: state.loading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : GridView.builder(
                              itemCount: state.products.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: (size.width / 200).floor(),
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 200 / 320,
                              ),
                              padding: const EdgeInsets.all(16),
                              itemBuilder: (context, index) {
                                return ProductCard(data: state.products[index]);
                              },
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
