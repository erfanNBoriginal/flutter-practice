part of 'category_cubit.dart';

@immutable
class CategoryState {
  //
  final bool loading;

  final CategoryData? category;

  final List<Product> products;

  const CategoryState({
    required this.loading,
    required this.category,
    required this.products,
  });

  const CategoryState.init()
      : loading = false,
        category = null,
        products = const [];

  CategoryState copyWith({
    bool? loading,
    CategoryData? category,
    List<Product>? products,
  }) {
    return CategoryState(
      loading: loading ?? this.loading,
      category: category ?? this.category,
      products: products ?? this.products,
    );
  }
}
