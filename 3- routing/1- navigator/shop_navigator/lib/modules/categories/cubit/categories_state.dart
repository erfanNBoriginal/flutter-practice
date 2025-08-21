part of 'categories_cubit.dart';

final class CategoriesState {
  //
  final bool loading;

  final List<CategoryData> categories;

  const CategoriesState({required this.loading, required this.categories});

  const CategoriesState.init()
      : loading = false,
        categories = const [];

  CategoriesState copyWith({bool? loading, List<CategoryData>? categories}) {
    return CategoriesState(
      loading: loading ?? this.loading,
      categories: categories ?? this.categories,
    );
  }
}
