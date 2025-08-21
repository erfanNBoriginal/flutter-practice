part of 'store_cubit.dart';

final class StoreState {
  //
  final bool loading;

  final List<Product> products;

  final List<CategoryData> categories;

  final Product? initialProduct;

  const StoreState({
    required this.loading,
    required this.products,
    required this.categories,
    required this.initialProduct,
  });

  const StoreState.init()
      : loading = false,
        products = const [],
        categories = const [],
        initialProduct = null;

  StoreState copyWith({
    bool? loading,
    List<CategoryData>? categories,
    List<Product>? products,
    Product? initialProduct,
  }) {
    return StoreState(
      loading: loading ?? this.loading,
      products: products ?? this.products,
      categories: categories ?? this.categories,
      initialProduct: initialProduct ?? this.initialProduct,
    );
  }
}
