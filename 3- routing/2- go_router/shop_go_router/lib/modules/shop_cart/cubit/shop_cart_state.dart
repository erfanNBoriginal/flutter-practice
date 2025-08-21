part of 'shop_cart_cubit.dart';

final class ShopCartState {
  //
  final bool loading;
  final int totalCost;
  final List<ShopItem> shopItems;

  const ShopCartState(
      {required this.totalCost,
      required this.loading,
      required this.shopItems});

  const ShopCartState.init()
      : loading = false,
        totalCost = 0,
        shopItems = const [];

  ShopCartState copyWith(
      {int? totalCost, bool? loading, List<ShopItem>? shopItems}) {
    return ShopCartState(
      totalCost: totalCost ?? this.totalCost,
      loading: loading ?? this.loading,
      shopItems: shopItems ?? this.shopItems,
    );
  }
}
