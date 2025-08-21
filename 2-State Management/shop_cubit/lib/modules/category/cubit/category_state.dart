part of 'category_cubit.dart';

final class CategoryState {
  //
  final bool loading;

  final List<CategoryData> categories;

  const CategoryState({required this.loading, required this.categories});

  const CategoryState.init() : loading = false, categories = const [];

  CategoryState copyWith({bool? loading, List<CategoryData>? categories}) {
    return CategoryState(
      loading: loading ?? this.loading,
      categories: categories ?? this.categories,
    );
  }
}
