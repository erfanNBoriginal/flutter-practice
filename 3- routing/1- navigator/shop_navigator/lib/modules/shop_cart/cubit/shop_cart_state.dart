part of 'shop_cart_cubit.dart';

final class ShopCartState {
  //
  final bool loading;

  final List<ShopItem> shopItems;

  const ShopCartState({required this.loading, required this.shopItems});

  const ShopCartState.init() : loading = false, shopItems = const [];

  ShopCartState copyWith({bool? loading, List<ShopItem>? shopItems}) {
    return ShopCartState(
      loading: loading ?? this.loading,
      shopItems: shopItems ?? this.shopItems,
    );
  }
}
