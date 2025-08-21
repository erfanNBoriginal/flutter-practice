part of 'category_cubit.dart';

@immutable
class CategoryState {
  final bool loading;

  final bool filterLoading;

  final CategoryData? category;

  final List<Product> products;

  final double minRate;

  final double maxRate;

  final int minPrice;

  final int maxPrice;

  final int sort;

  final int order;

  const CategoryState({
    required this.loading,
    required this.filterLoading,
    required this.category,
    required this.products,
    required this.minRate,
    required this.maxRate,
    required this.minPrice,
    required this.maxPrice,
    required this.sort,
    required this.order,
  });

  const CategoryState.init({this.category})
      : loading = false,
        filterLoading = false,
        products = const [],
        minRate = 0,
        maxRate = 5,
        minPrice = 0,
        maxPrice = 500000000,
        sort = 0,
        order = 0;

  CategoryState copyWith({
    bool? loading,
    bool? filterLoading,
    CategoryData? category,
    List<Product>? products,
    double? minRate,
    double? maxRate,
    int? minPrice,
    int? maxPrice,
    int? sort,
    int? order,
  }) {
    return CategoryState(
      loading: loading ?? this.loading,
      filterLoading: filterLoading ?? this.filterLoading,
      category: category ?? this.category,
      products: products ?? this.products,
      minRate: minRate ?? this.minRate,
      maxRate: maxRate ?? this.maxRate,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      sort: sort ?? this.sort,
      order: order ?? this.order,
    );
  }
}
