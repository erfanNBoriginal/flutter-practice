part of 'store_cubit.dart';

final class StoreState {
  //
  final bool loading;

  final List<Product> products;

  final List<CategoryData> categories;

  const StoreState({
    required this.loading,
    required this.products,
    required this.categories,
  });

  const StoreState.init()
    : loading = false,
      products = const [],
      categories = const [];

  StoreState copyWith({
    bool? loading,
    List<CategoryData>? categories,
    List<Product>? products,
  }) {
    return StoreState(
      loading: loading ?? this.loading,
      products: products ?? this.products,
      categories: categories ?? this.categories,
    );
  }
}
